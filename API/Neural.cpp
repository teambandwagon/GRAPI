#include <math.h>

#include "Neural.hpp"
#include "NeuralData.hpp"


static double sigmoid(double n) {
   return (2 / (1 + exp((-2) * n))) - 1;
}

static double dot_product(int num, const double* v1, const double* v2) {
	double r = 0.0;
	for (int i = 0; i < num; i++) {
		r += v1[i] * v2[i];
	}
	return r;
}

NeuralNetwork::NeuralNetwork(void) {
  gain = NeuralData::gain;
  offset = NeuralData::offset;
  yMin = NeuralData::yMin;
  weights_hidden = NeuralData::weights_hidden;
  bias_hidden = NeuralData::bias_hidden;
  weights_output = NeuralData::weights_output;
  bias_output = NeuralData::bias_output;
}

NeuralNetwork::~NeuralNetwork(void) {
}

void NeuralNetwork::preprocess(const double* inputs) const {
  for (int input = 0; input < NeuralData::input_num; input++) {
    preprocessed[input] = gain[input] * (inputs[input] - offset[input]) + yMin;
  }
}

void NeuralNetwork::hidden_layer(void) const {
  for (int neuron = 0; neuron < NeuralData::hidden_num; neuron++) {
    double sum = dot_product(NeuralData::input_num, weights_hidden[neuron], preprocessed);
    hidden_outputs[neuron] = sigmoid(sum + bias_hidden[neuron]);
  }
}

void NeuralNetwork::output_layer(double* outputs) const {
  for (int neuron = 0; neuron < NeuralData::output_num; neuron++) {
    double sum = dot_product(NeuralData::hidden_num, weights_output[neuron], hidden_outputs);
    outputs[neuron] = sum + bias_output[neuron];
  }
}

void NeuralNetwork::process(const double* inputs, double* outputs) const {
  preprocess(inputs);
  hidden_layer();
  output_layer(outputs);
}
