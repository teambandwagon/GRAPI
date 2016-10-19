#include "GRAPI.hpp"

static void softmax(int num, const double* values, double* outputs) {
  double sum = 0.0;
  for (int i = 0; i < num; i++) {
    sum += exp(values[i]);
  }
  if (sum == 0.0) {
    sum = 1.0;
  }
  for (int i = 0; i < num; i++) {
    outputs[i] = exp(values[i]) / sum;
  }
}

void GRAPI::record_point(float x, float y, float z, float gx, float gy, float gz) {
	data[(roundRobin * 6) + 0] = x;
	data[(roundRobin * 6) + 1] = y;
	data[(roundRobin * 6) + 2] = z;
	data[(roundRobin * 6) + 3] = gx;
	data[(roundRobin * 6) + 4] = gy;
	data[(roundRobin * 6) + 5] = gz;

  roundRobin++;
  if (roundRobin == 10) {
     roundRobin = 0;
  }
	
	computed = false;
}

void GRAPI::normalize(void) {
  double tmpData[6];
  for (int i = 0; i < 6; i++) {
      data[i] = tmpData[i];
  }
  for (int i = 0; i < 10; i++) {
      for (int j = 0; j < 6; j++) {
        data[(i * 6) + j] = data[(((roundRobin + i) % 10) * 6) + j];
      }
  }

  roundRobin = 0;
}

void GRAPI::compute(void) {
	if (!computed) {
		computed = true;
    normalize();
		net.process(data, raw_outputs);
		
		softmax(NeuralData::output_num, raw_outputs, outputs);
	}
}

GRAPI::GRAPI(void)  : computed(false), roundRobin(0) {
	for (int gesture = 0; gesture < GESTURE_COUNT; gesture++) {
  		thresholds[gesture] = DEFAULT_THRESHOLD;
	}
}

double GRAPI::probability(Gesture gesture) {
  compute();
	return outputs[(int) gesture];
}

bool GRAPI::gesture(Gesture gesture) {
	if (outputs[gesture] > thresholds[gesture]) {
		return true;
	} else {
		return false;
	}
}

double GRAPI::get_threshold(Gesture gesture) {
	return thresholds[gesture];
}

void GRAPI::set_threshold(Gesture gesture, double threshold) {
	thresholds[gesture] = threshold;
}

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

