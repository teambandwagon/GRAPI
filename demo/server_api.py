import socket
import neural
import display_old

# server for the GRAPI demo
# reads datasets from the arduino, then uses the neural network to
# work out the gesture

DEFAULT_PORT = 9876 # empherial port

BUFFER_SIZE = 1024 * 8

# names of gestures, indexed by the output neurons indices
gestures = ["Idle", "Push", "Pull", "Dragleft", "Dragright", "Hit", "Lift", "Screwin", "Screwout"]

# addr = IP of host
# fileout = file to dump data to
# port = port part of TCP address
def datadump(addr = '', fileout = "demo_data_record.txt", port = DEFAULT_PORT):
    # makes a server socket
    s = socket.socket(socket.AF_INET, socket.SOCK_STREAM)
    s.bind((addr, port))
    s.listen(1)

    # waits until something connects to us
    print("waiting on port", port)
    (sock, clientAddress) = s.accept()
    print("connection accepted from", clientAddress)

    display_old.start_game()

    # pulls from the socket and runs the ANN over the data
    data = ""
    while (True):
        # waits for the user
        #num = raw_input("<<Press enter>>")
        # end program
        #if (num == 'e'):
        #    break
        # tells the arduino to start sending data
        #sock.send(bytearray("continue\n", 'utf8'))
        # reads a block of data from the arduino
        while "&" not in data:
            data += sock.recv(BUFFER_SIZE).decode('utf-8')
            #print data
        data = data.split("&", 2)
        result = data[0];
        print result
        if (len(data) != 1):
            data = data[1];
        else:
            data = ""
        # converts the data into a list of floats for the ANN
        result = [float(i) for i in result.split(",")[:-1]]
        print result
        # puts the data through the ANN
        m = max(result)
        if m > 0.90:
            gesture = gestures[result.index(m)]
            display_old.set_gesture(gesture)
        else:
            gesture = "Unrecognised"
            display_old.set_gesture(gesture)
        display_old.show_percentages(result)

    display_old.stop_game()
    print("connection closed")
    sock.close()

if __name__ == "__main__":
	datadump()
