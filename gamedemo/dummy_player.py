import socket

def dummyPlayer(port):
    s = socket.socket(socket.AF_INET, socket.SOCK_STREAM)
    s.connect(("127.0.0.1", port))
    return s


if (__name__ == "__main__"):
    port = int(raw_input(">>"))
    s = dummyPlayer(port)
    raw_input(">>")
    s.close()
