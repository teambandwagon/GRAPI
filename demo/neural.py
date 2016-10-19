from __future__ import division
from neural_data import *
from math import exp, e

# sigmoid function, used by the hidden neurons
# (runs over individual values)
def sig(n):
    return (2 / (1 + (e)**(-2 * n))) - 1

# softmax function, used by the output neurons
# (runs over an array)
# (also doesn't work properly right now (right results but scaled wrongly))
def softmax(data):
    exponentials = [exp(value) for value in data]
    denominator = sum(exponentials)
    return [numerator/denominator for numerator in exponentials]

# initial processing of inputs at the start of the ANN (pre-neurons)
#
# basically just scales inputs using offset and gain
def preprocess(data):
    data = [((data[input] - offset[input]) * gain[input] + ymin) for input in inputs]
    return data

# processing by the hidden layer of neurons
#
# takes the inputs, calculates a weighted sum over them, adds the neuron's bias,
# then pushes the result through the sigmoid function to get the output
#
# data: inputs to the neuron (list)
# neuron: index of the neuron
def hidden_layer(data, neuron):
    weighted_sum = sum([weights_hidden[neuron][input] * data[input] for input in inputs])
    return sig(bias_hidden[neuron] + weighted_sum)

# processing by the output layer of neurons
#
# takes inputs from hidden neurons, weights and biases them
# notably doesn't run softmax on them (softmax needs the
# data from all of the neurons, so is run later)
#
# data: inputs to the neuron (list)
# neuron: index of the neuron
def output_layer(data, neuron):
    weighted_sum = sum([weights_output[neuron][input] * data[input]
                        for input in hidden_neurons])
    return bias_output[neuron] + weighted_sum

# runs the full neural network over a dataset
# returns the list of outputs from the output neurons
def neural(data):
    data = preprocess(data)
    data = [hidden_layer(data, n) for n in hidden_neurons]
    data = [output_layer(data, n) for n in output_neurons]
    data = softmax(data)
    return data

# returns the name of the gesture calculated to be 'most likely' by the ANN
def best(data):
    data = neural(data)
    m = max(data)
    #return gestures[data.index(m)]
    return data

# names of gestures, indexed by the output neurons indices
gestures = [
    "idle", "push", "pull", "dragleft", "dragright",
    "hit", "lift", "screwin", "screwout"
]
