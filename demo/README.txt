demo

This folder contains files for reading live data from the arduino device, processing the data through a neural network, and outputting what gesture is being recognised.

Contents:

	"neural.py" processes data received using the weightings in “neural_data.py” and returns a result

	"neural_data.py" contains the weightings produced from MATLAB's processing of the data

	"server.py" connects to the arduino device to receive live data

the arduino itself runs the "connect.ino" program found in recording