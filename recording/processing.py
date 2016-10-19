import os

# opens file to read the available gestures
def load_config(configFileName = "processingConfig.txt"):
    with open(configFileName, "r") as config:
        nameList = []
        for line in config:
            line = line.strip()
            if (len(line) != 0 and line[0] != '#'):
                nameList.append(line)
        names = {}
        for i in range(len(nameList)):
            names[nameList[i]] = i
        return (names, nameList)

# writes data from provided file into data file and results file
def process_file(folder, fileName, data, results, config):
    fileSpecs = fileName[:fileName.index(".")].split("_")
    # writes a set of 0's and 1's to indicate which gesture is being processed
    resultLine = " ".join(["1" if config[i] in fileSpecs else "0"
                  for i in range(len(config))]) + "\n"
    with open(folder + "\\" + fileName, "r") as f:
        for line in f:
            line = line.strip()
            if (len(line) != 0 and line[0] != '#'):
                data.write(line + "\n")
                results.write(resultLine)

# opens a data and results file, and concats all the data from the data folder
def process_data(dataFolderName = "data",
                 dataFileName = "data.txt", resultFileName = "results.txt"):
    _, config = load_config()
    with open(dataFileName, "w") as data:
        with open(resultFileName, "w") as results:
            # reads each data file in the data folder
            for fileName in os.listdir(dataFolderName):
                process_file(dataFolderName, fileName,
                        data, results, config)

# runs process
if __name__ == "__main__":
    process_data()
