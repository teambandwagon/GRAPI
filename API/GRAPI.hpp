#ifndef INC_GRAPI_HPP
#define INC_GRAPI_HPP

#include <WiFiClient.h>
#include <ESP8266WiFi.h>

#include "Neural.hpp"
#include "NeuralData.hpp"

/* gestures that can be recogized by the API */
enum Gesture {
	IDLE = 0,
	PUSH = 1,
	PULL = 2,
	DRAGRIGHt = 3,
	DRAGLEFT = 4,
	HIT = 5,
	LIFT = 6,
	SCREWIN = 7,
	SCREWOUT = 8
};

#define GESTURE_COUNT (9)
#define DEFAULT_THRESHOLD (0.90)

class GRAPI {
private:
	NeuralNetwork net; /* neural network used to recognize gestures */
	double data[60]; /* movement data, ten sets of six axis */
	int ringBufferOffset; /* offset for the current 'zero' in data (used as a ring buffer) */
	double outputs[GESTURE_COUNT]; /* probabilities of gestures recognized */
	double thresholds[GESTURE_COUNT]; /* certainty thresholds for gestures */
	bool computed; /* whether the current set of data has been put through the neural network
					* (basically whether outputs is up-to-date with data)
					*/
	
	void compute(void); /* runs the neural network */
	void normalize(void); /* unravels the ring buffer */
public:
	GRAPI(void); /* constructor */
	void record_point(double x, double y, double z, double gx, double gy, double gz); /* adds a single 6-dof data point */

	Gesture gesture(void); /* returns the most likely gesture */
	bool gesture(Gesture gesture); /* returns whether the probability of 'gesture' is above its threshold */
	double probability(Gesture gesture); /* gets the probability that a gesture was made */

	double get_threshold(Gesture gesture); /* gets the threshold for the given gesture */
	void set_threshold(Gesture gesture, double threshold); /* sets the threshold for the given gesture */
};

const String gestureNames[GESTURE_COUNT] = {"idle", "push", "pull", "dragleft", "dragright", "hit", "lift", "screwin", "screwout"};

#endif
