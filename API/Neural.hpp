#ifndef INC_NEURAL_HPP
#define INC_NEURAL_HPP

const int inputNum = 60;
const int hiddenNum = 20;
const int outputNum = 9;

class NeuralNetwork {
public:
  NeuralNetwork(void);
	~NeuralNetwork(void);
	void process(const double* inputs, double* outputs) const;
  // temp variables for processing
  mutable double preprocessed[60];
  mutable double hidden_outputs[20];

  void preprocess(const double* inputs) const;
  void hidden_layer(void) const;
  void output_layer(double* outputs) const;
	const double* gain;
	const double* offset;
  double yMin;
	const double** weights_hidden;
	const double* bias_hidden;
	const double** weights_output;
	const double* bias_output;

};

#endif
