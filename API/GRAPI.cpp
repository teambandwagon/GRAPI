#include "GRAPI.hpp"

/* stores the received data points
 *
 * to avoid needing to shift the entire set of 60 doubles every time a point is
 * added, the data is stored in a ring buffer
 * when the actual ANN is used the ring buffer is unwrapped into a normal array 
 * by the function normalize
 *
 * needs to be called with fresh data roughly once every 100ms
 *
 * x,y,z: acceleration values
 * gx, gy, gz: orientation values
 */
void GRAPI::record_point(double x, double y, double z, double gx, double gy, double gz) {
	data[(ringBufferOffset * 6) + 0] = x;
	data[(ringBufferOffset * 6) + 1] = y;
	data[(ringBufferOffset * 6) + 2] = z;
	data[(ringBufferOffset * 6) + 3] = gx;
	data[(ringBufferOffset * 6) + 4] = gy;
	data[(ringBufferOffset * 6) + 5] = gz;

  ringBufferOffset++;
  if (ringBufferOffset == 10) {
     ringBufferOffset = 0;
  }
	
	computed = false;
}

/* unravels the recorded data for the neural network
 */
void GRAPI::normalize(void) {
  double tmpData[6];
  for (int i = 0; i < 6; i++) {
      data[i] = tmpData[i];
  }
  for (int i = 0; i < 10; i++) {
      for (int j = 0; j < 6; j++) {
        data[(i * 6) + j] = data[(((ringBufferOffset + i) % 10) * 6) + j];
      }
  }

  ringBufferOffset = 0;
}

/* runs the data through the neural network
 *
 * ANN is slow, so we want to calculate the probabilities only when we need to
 * 'computed' keeps track of whether we've processed the current set of data, so
 * we only use the ANN when we want to check for a gesture and the gesture probabilities
 * aren't up-to-date with the movement data
 */
void GRAPI::compute(void) {
	if (!computed) {
		computed = true;
		normalize();
		net.process(data, outputs);
	}
}

// initializes the GRAPI object
GRAPI::GRAPI(void)  : computed(false), ringBufferOffset(0) {
	for (int gesture = 0; gesture < GESTURE_COUNT; gesture++) {
  		thresholds[gesture] = DEFAULT_THRESHOLD;
	}
}

// gets the probabilty of the given gesture
double GRAPI::probability(Gesture gesture) {
  compute();
	return outputs[(int) gesture];
}

// checks if a gesture probabilty is above the threshold
bool GRAPI::gesture(Gesture gesture) {
	if (outputs[gesture] > thresholds[gesture]) {
		return true;
	} else {
		return false;
	}
}

// gets the threshold
double GRAPI::get_threshold(Gesture gesture) {
	return thresholds[gesture];
}

// sets the threshold
void GRAPI::set_threshold(Gesture gesture, double threshold) {
	thresholds[gesture] = threshold;
}

// returns the most likely gesture from the local data stored
Gesture GRAPI::gesture(void) {
	compute();
	int best = 0;
	for (int i = 1; i < NeuralData::output_num; i++) {
		if (outputs[best] < outputs[i]) {
			best = i;
		}
	}
	return (Gesture) best;
}

