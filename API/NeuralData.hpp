#ifndef INC_NEURAL_DATA_HPP
#define INC_NEURAL_DATA_HPP

namespace NeuralData {
  extern const int input_num;
  extern const int hidden_num;
  extern const int output_num;

  extern const double yMin;
  extern const double gain[60];
  extern const double offset[60];

  extern const double bias_hidden[20];
  extern const double bias_output[9];
  extern const double* weights_hidden[20];
  extern const double* weights_output[9];
};
#endif
