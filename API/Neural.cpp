#include <math.h>

#include "Neural.hpp"
#include "NeuralData.hpp"

/* Competitive Soft Transfer Function
 *
 * 'squeezes' the output of the neural network into unit vector (sums to one)
 */
static void softmax(int num, double* values) {
  double sum = 0.0;
  for (int i = 0; i < num; i++) {
    sum += exp(values[i]);
  }
  if (sum == 0.0) {
    sum = 1.0;
  }
  for (int i = 0; i < num; i++) {
    values[i] = exp(values[i]) / sum;
  }
}

/* Sigmoid Symmetric Transfer Function
 * 
 * specifically, a logistic function onto (-1, 1)
 */
static double sigmoid(double n) {
   return (2 / (1 + exp((-2) * n))) - 1;
}

/* calculates the vector dot product of two arrays
 *  
 *  num: length of the arrays
 *  v1: first vector
 *  v2: second vector
 */
static double dot_product(int num, const double* v1, const double* v2) {
	double r = 0.0;
	for (int i = 0; i < num; i++) {
		r += v1[i] * v2[i];
	}
	return r;
}

// gets weightings from NeuralData.cpp 
NeuralNetwork::NeuralNetwork(void) {
  gain = NeuralData::gain;
  offset = NeuralData::offset;
  yMin = NeuralData::yMin;
  weights_hidden = NeuralData::weights_hidden;
  bias_hidden = NeuralData::bias_hidden;
  weights_output = NeuralData::weights_output;
  bias_output = NeuralData::bias_output;
}

/* preprocessing for the ANN
 * scales each of the inputs to the network, then adds an offset
 */
void NeuralNetwork::preprocess(const double* inputs) const {
  for (int input = 0; input < NeuralData::input_num; input++) {
    preprocessed[input] = gain[input] * (inputs[input] - offset[input]) + yMin;
  }
}

/* hidden layer for the network
 * takes the preprocessed inputs, weights them and puts them through the sigmoid function
 */
void NeuralNetwork::hidden_layer(void) const {
  for (int neuron = 0; neuron < NeuralData::hidden_num; neuron++) {
    double sum = dot_product(NeuralData::input_num, weights_hidden[neuron], preprocessed);
    hidden_outputs[neuron] = sigmoid(sum + bias_hidden[neuron]);
  }
}

/* output layer for the network
 * weights the output from the hidden layer
 * doesn't have a non-linear component
 * (scaling the output from here is done by the calling code, usually using softmax)
 */
void NeuralNetwork::output_layer(double* outputs) const {
  for (int neuron = 0; neuron < NeuralData::output_num; neuron++) {
    double sum = dot_product(NeuralData::hidden_num, weights_output[neuron], hidden_outputs);
    outputs[neuron] = sum + bias_output[neuron];
  }
}

/* processes the given data through the neural network layers
 * 
 * inputs: input data, should be double[60]
 * outputs: output from the network, should be double[9]
 */
void NeuralNetwork::process(const double* inputs, double* outputs) const {
  preprocess(inputs);
  hidden_layer();
  output_layer(outputs);
  softmax(NeuralData::output_num, outputs);
}
