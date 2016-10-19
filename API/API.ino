#include <ESP8266WiFi.h>
#include <ESP8266WiFiAP.h>
#include <ESP8266WiFiGeneric.h>
#include <ESP8266WiFiMulti.h>
#include <ESP8266WiFiScan.h>
#include <ESP8266WiFiSTA.h>
#include <ESP8266WiFiType.h>
#include <WiFiClient.h>
#include <WiFiClientSecure.h>
#include <WiFiServer.h>
#include <WiFiUdp.h>

#include <Wire.h>
#include <Adafruit_Sensor.h>
#include <Adafruit_BNO055.h>
#include <utility/imumaths.h>
#include <ESP8266WiFi.h>
#include <EEPROM.h>

#include "calibrate.h"
#include "GRAPI.hpp"

const int SERIAL_BAUD_RATE = 115200;
int count = 0;

Adafruit_BNO055 bno = Adafruit_BNO055(55);

boolean init_sensor(void) {
  return bno.begin();
}

void init_serial(void) {
  Serial.begin(SERIAL_BAUD_RATE);
  delay(100);
}

//const char* NETID = "ii19B28Eprimary";
//const char* NETPW = "Reverse_Arc";  

const char* NETID = "NoFreeWifi";
const char* NETPW = "qwertyui";

WiFiClient client;
// port and ip of desktop side of the recording
const int port = 9877;
const char* ip = "10.52.37.153";
//const char* ip = "192.168.1.234";

void init_wifi(void) {

  IPAddress myip(10, 52, 37, 155);
  IPAddress gateway(10, 52, 1, 1);
  IPAddress subnet(255, 255, 0, 0);

//  IPAddress myip(192, 168, 1, 236);
//  IPAddress gateway(192, 168, 1, 1);
//  IPAddress subnet(255, 255, 255, 0);

  Serial.println();
  Serial.println();
  Serial.print("Connecting to ");
  Serial.print(NETID);

  WiFi.begin(NETID, NETPW);
  //WiFi.config(myip, gateway, subnet); // :IPCHANGE


  /* never comes out of the loop, not sure why
   * (for now just delay 5s and hope for the best)
   */
  /* while (WiFi.status() != WL_CONNECTED) {
   *  delay(500);
   *  Serial.print(".");
   * }
   */
  delay(5000);

  Serial.println();
  Serial.print("WiFi connected as ");
  Serial.println(WiFi.localIP());
}

bool init_wifi_connection(void) {
  return client.connect(ip, port);
}

// runs once to set stuff up
void setup() {
  init_serial();
  init_wifi();

  if (init_sensor()) {
    Serial.println("init sensor");
  } else {
    Serial.print("cannot init sensor");
    while (1);
  }
  
  // don't know how much EEPROM memory we need, just grab all of it
  EEPROM.begin(4000);
  calibrate_sensor(bno);
  EEPROM.end();

  client.setNoDelay(0);
  
  if (!init_wifi_connection()) {
    Serial.print("cannot connect to ");
    Serial.print(ip);
    Serial.print(":");
    Serial.println(port);
  }
}

GRAPI grapi;

void loop() {
  for (int i = 0; i < 10; i++) {
    delay(100);
    imu::Vector<3> linac = bno.getVector(Adafruit_BNO055::VECTOR_LINEARACCEL);
    imu::Vector<3> geo = bno.getVector(Adafruit_BNO055::VECTOR_EULER);
    grapi.record_point(geo[0], geo[1], geo[2],  linac[0], linac[1], linac[2]);
  }
  Serial.println(gestureNames[grapi.gesture()]);
  String output;
  for (int i = 0; i < 8; i++) {
       output.concat(String(grapi.probability((Gesture) i), 4));
       output.concat(",");
  }
  output.concat(String(grapi.probability((Gesture) 8), 4));
  output.concat("&");
  client.println(output);
  client.flush();
}
