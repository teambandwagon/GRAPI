ymin = -1

left = "{"
right = "}"

filename = input("file>")

with open("MATLAB\\" + filename, "r") as f:
    for line in f:
        if (line.startswith("x1_step1.xoffset = [")):
            offset = line[len("x1_step1.xoffset = ["):-3]
        elif (line.startswith("x1_step1.gain = [")):
            gain = line[len("x1_step1.gain = ["):-3]
        elif (line.startswith("b1 = [")):
            bias_hidden = line[len("(b1 = ["):-3]
        elif (line.startswith("IW1_1 = [")):
            weights_hidden = line[len("IW1_1 = ["):-3]
        elif (line.startswith("b2 = [")):
            bias_output = line[len("b2 = ["):-3]
        elif (line.startswith("LW2_1 = [")):
            weights_output = line[len("LW2_1 = ["):-3]


# deals with 1-D arrays
def breakup(v, delim = ";"):
    return left + ", ".join(v.split(delim)) + right

# deals with 2-D arrays
def splinter(v):
    v = v.split(";")
    v = [breakup(i, " ") for i in v]
    return left + ", ".join(v) + right
    return v

offset = breakup(offset)
gain = breakup(gain)
bias_hidden = breakup(bias_hidden)
bias_output = breakup(bias_output)

weights_hidden = splinter(weights_hidden)
weights_output = splinter(weights_output)

with open("frame_cpp.txt", "r") as f:
    frame = f.read();
	
with open("neuralData.cpp", "w") as f:
    frame = frame.replace("^", offset, 1)
    frame = frame.replace("^", gain, 1)
    frame = frame.replace("^", bias_output, 1)
    frame = frame.replace("^", bias_hidden, 1)
    frame = frame.replace("^", weights_output, 1)
    frame = frame.replace("^", weights_hidden, 1)
    f.write(frame)

with open("frame_py.txt", "r") as f:
    frame = f.read();

offset = offset.replace("{", "[").replace("}", "]")
gain = gain.replace("{", "[").replace("}", "]")
bias_output = bias_output.replace("{", "[").replace("}", "]")
bias_hidden = bias_hidden.replace("{", "[").replace("}", "]")
weights_output = weights_output.replace("{", "[").replace("}", "]")
weights_hidden = weights_hidden.replace("{", "[").replace("}", "]")

with open("neural_data.py", "w") as f:
    frame = frame.replace("^", offset, 1)
    frame = frame.replace("^", gain, 1)
    frame = frame.replace("^", bias_output, 1)
    frame = frame.replace("^", bias_hidden, 1)
    frame = frame.replace("^", weights_output, 1)
    frame = frame.replace("^", weights_hidden, 1)
    f.write(frame)


