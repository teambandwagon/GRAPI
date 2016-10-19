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

const int SERIAL_BAUD_RATE = 115200;
int count = 0;

Adafruit_BNO055 bno = Adafruit_BNO055(55);

boolean init_sensor(void) {
  return bno.begin();
}

void init_serial(void) {
  // serial prints stuff over the USB connection i think?
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

  client.setNoDelay(1);
  
  if (!init_wifi_connection()) {
    Serial.print("cannot connect to ");
    Serial.print(ip);
    Serial.print(":");
    Serial.println(port);
  } else {
    Serial.println("connected");
  }
}

/* retrieves a single dataset from the sensor, adds it to the string */
void retrieve_sensor_moment(String& data) {
    sensors_event_t event;
    bno.getEvent(&event);
    imu::Vector<3> linac = bno.getVector(Adafruit_BNO055::VECTOR_LINEARACCEL);
    data.concat("");
    data.concat(String(event.orientation.x, 4));
    data.concat(",");
    data.concat(String(event.orientation.y, 4));
    data.concat(",");
    data.concat(String(event.orientation.z, 4));
    data.concat(",");
    data.concat(String(linac[0], 4));
    data.concat(",");
    data.concat(String(linac[1], 4));
    data.concat(",");
    data.concat(String(linac[2], 4));
    data.concat("");
  
//    Serial.print(event.orientation.x, 4);
//    Serial.print(", ");
//    Serial.print(event.orientation.y, 4);
//    Serial.print(", ");
//    Serial.print(event.orientation.z, 4);
//    Serial.print(data);
//    Serial.println();
}

void loop() {
  /* delay until we get something over the network connection */
  String s = "";
  while (s.length() == 0) {
    while(client.available()) {
      s = client.readStringUntil('\n');
      delay(50);
    }
  }

  /* retrieves a second's worth of data points (10/second)
   * and puts it into a string
   */
  int i;
  String data = "";
  for (i = 0; i < 10; i++) {
    retrieve_sensor_moment(data);
    if (i != 9) {
      data.concat(",");
    }
    delay(100);
  }
  count++;
  Serial.print("Count: ");
  Serial.println(count);

  Serial.println(data);
  /* send data back over connection */
  data.concat("&"); // terminating character
  client.println(data);
}
