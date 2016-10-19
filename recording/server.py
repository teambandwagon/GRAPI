import socket

# basic socket-to-file server
#
# waits to be connected to, then dumps everything coming over
# the socket into a file

DEFAULT_PORT = 9877 # empherial port

BUFFER_SIZE = 1024 * 8

fileName = "example"

# addr = IP of host
# fileout = file to dump data to
# port = port part of TCP address
def datadump(addr = '', fileout = fileName + ".txt", port = DEFAULT_PORT):
    # makes a server socket
    s = socket.socket(socket.AF_INET, socket.SOCK_STREAM)    
    s.bind((addr, port))
    s.listen(1)

    # waits until something connects to us
    print("waiting on port", port)
    (sock, clientAddress) = s.accept()
    print("connection accepted from", clientAddress)

    count = 0;

    # pulls from the socket and puts whatever it gets into a file
    with open(fileout, "a") as f: # 'wb' lets us get binary data if we need it
        while (True):
            num = input("<<Press enter>>")
            if (num == 'e'): break
            sock.send(bytearray("continue\n", 'utf8'))
            data = ""
            while "&" not in data:
                data += sock.recv(BUFFER_SIZE).decode('utf-8')
            f.write(data.replace("&", ""))
            print(str(data))
            count += 1
            print("Count: " + str(count))

    print("connection closed")

    sock.close()

if __name__ == "__main__":
    datadump()
