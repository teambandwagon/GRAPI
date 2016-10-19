recording

This folder contains files for recording and processing data from the arduino device, as well as a neural network that is being trained by this data. 

Contents:

	"connect" folder contains arduino code for sending data to the host computer

	"data" folder contains separate data files for each of the gestures

	"MATLAB" folder contains a neural network made with MATLAB

	"data.txt" file contains all data used to train a neural network

	"processing.py" generates the data and results file

	"processingConfig.txt" file contains all the gestures being trained into the neural network

	"results.txt" file contains the associated results for each set of data in the data file

	"server.py" reads data being sent from the arduino, and saves it in a folder 