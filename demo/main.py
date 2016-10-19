import socket
import neural
from tkinter import *
import threading
from threading import Timer

# server for the GRAPI demo
# reads datasets from the arduino, then uses the neural network to
# work out the gesture

port = 9877 # empherial port

BUFFER_SIZE = 1024 * 8

# names of gestures, indexed by the output neurons indices
gestures = ["Idle", "Push", "Pull", "Dragleft", "Dragright", "Hit", "Lift", "Screwin", "Screwout"]

# addr = IP of host
# fileout = file to dump data to
# port = port part of TCP address
addr = ''
prob_thresh = 0.95

# makes a server socket
s = socket.socket(socket.AF_INET, socket.SOCK_STREAM)
s.setsockopt(socket.SOL_SOCKET, socket.SO_REUSEADDR, 1)
s.bind((addr, port))
s.listen(1)

# waits until something connects to us
print("waiting on port", port)
(sock, clientAddress) = s.accept()
print("connection accepted from", clientAddress)

global event_probs
event_probs = [0.0] * 60

global ann_local
ann_local = False

def read_data(*args):
    global event_probs
    while True:
        root = args[0]
        # tells the arduino to start sending data
        sock.send(bytearray("continue\n", 'utf8'))
        # reads a block of data from the arduino
        data = ""
        while "&" not in data:
            data += sock.recv(BUFFER_SIZE).decode('utf-8')
        data = data.replace("&", "")
        # converts the data into a list of floats for the ANN
        data = [float(i) for i in data.split(",")]
        # puts the data through the ANN
        #event_lock.acquire(True)
        if ann_local:
            result = event_probs[60:]# + data
        else:
            result = data
        event_probs = result
        root.event_generate("<<socket_data>>", when="tail")
        #event_lock.release()

print("opening TK")
root = Tk()

root.title("GRAPI")

screen_frame = Frame(root, bg='white')
screen_frame.pack()

top_frame = Frame(screen_frame, bg='white')
top_frame.pack()

label_frame = Frame(top_frame, bg='white', height=400)
label_frame.pack(side=LEFT, fill=Y)

probability_canvas = Canvas(top_frame, bg='white', height=620, width=500)
probability_canvas.pack(side=LEFT)

gesture_frame = Frame(screen_frame, bg='white')
gesture_frame.pack(fill=X)

threshold = probability_canvas.create_line(305 * prob_thresh, 57, 305 * prob_thresh, 280)
threshold_text = probability_canvas.create_text(305 * prob_thresh, 40, text="Threshold: %0.0f%%" % (prob_thresh * 100), font="Ariel 12")
threshold_text = probability_canvas.create_text(305 * prob_thresh + 140, 40, text="Probability:", font="Ariel 12")

photobox = probability_canvas.create_rectangle(15, 300, 485, 600)

photo = PhotoImage(file = 'doggo.gif')
dog = probability_canvas.create_image(250, 450, image=photo)

gesture_text = StringVar()
gesture_text.set("Gesture: \n\n")

probability_text = StringVar()
probability_text.set("Highest\nProbability:\n\n")

gesture_label = Label(label_frame, text="Gestures: ", font="Helvetica 18 bold", anchor=W, bg='white')
gesture_label.pack()

gesture_label = Label(label_frame, text="\nIdle\nPush\nPull\nDragleft\nDragright\nHit\nLift\nScrewin\nScrewout\n", font="Ariel 16", anchor=W, justify=LEFT, bg='white')
gesture_label.pack()

gesture_label = Label(label_frame, textvariable=probability_text, font="Ariel 16", bg='white')
gesture_label.pack()

gesture_label = Label(label_frame, textvariable=gesture_text, font="Ariel 16", bg='white')
gesture_label.pack()

#read_button = Button(label_frame, text="Read", command=read_data, font="Ariel 16", bg='white')
#read_button.pack()

def on_closing():
    print("Connection closed")
    sock.close()
    label_frame.quit()

root.protocol("WM_DELETE_WINDOW", on_closing)

def display_data(*args):
    global event_probs
    global event_lock
    #event_lock.acquire(True)
    result = event_probs
    #event_lock.release()
    if ann_local:
        result = neural.best(result)
    m = max(result)
    max_index = result.index(m)
    probability_text.set("Highest\nProbability:\n%0.2f%%\n" % (m * 100))
    probability = probability_canvas.create_rectangle(0, 0, 500, 300, fill='white', width=0)
    for i in range(0,9):
        if i == max_index and m > prob_thresh:
            colour = "green"
        else:
            colour = "red"
        probability = probability_canvas.create_rectangle(5, 63 + i * 24, 5 + 300 * result[i], 85 + i * 24, fill=colour)
        threshold_text = probability_canvas.create_text(305 * prob_thresh + 140, 70 + i * 25, text="%0.5f%%" % result[i], font="Ariel 10")
    threshold = probability_canvas.create_line(305 * prob_thresh, 57, 305 * prob_thresh, 280)
    threshold_text = probability_canvas.create_text(305 * prob_thresh, 40, text="Threshold: %0.0f%%" % (prob_thresh * 100), font="Ariel 14")
    threshold_text = probability_canvas.create_text(305 * prob_thresh + 140, 40, text="Probabilities: ", font="Ariel 12")
    if m > prob_thresh:
        gesture = gestures[max_index]
        gesture_text.set("Gesture: \n" + gesture + "\n")
        print(gesture)

root.bind("<<socket_data>>", display_data)

read_thread = threading.Thread(target=read_data, args=(root,))
read_thread.start()

root.mainloop()
root.destroy()
