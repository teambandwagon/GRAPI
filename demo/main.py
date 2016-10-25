import socket
import neural
from tkinter import *
import time
import threading
from threading import Timer

# server for the GRAPI demo
# reads datasets from the arduino, then uses the neural network to
# work out the gesture

port = 9877 # empherial port

BUFFER_SIZE = 1024 * 8

print("opening TK")
root = Tk()

root.title("GRAPI")


# names of gestures, indexed by the output neurons indices
gestures = ["Idle", "Push", "Pull", "DragLeft", "DragRight", "Hit", "Lift", "ScrewIn", "ScrewOut"]

def load_gif(fname):
    frames = []
    try:
        i = 0
        while True:
            frame = PhotoImage(file=fname, format="gif -index " + str(i))
            if frame is None:
                break
            frames.append(frame)
            #print frame, fname, i
            i += 1
    except Exception:
        pass
    return frames

# turns on/off animation
animation_on = False

if animation_on:
    gestureImages = [load_gif(i + ".gif") for i in gestures]

# addr = IP of host
# fileout = file to dump data to
# port = port part of TCP address
addr = ''

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
event_probs = [0.0] * 10

# controls whether to use the local python ANN or the arduino-based ANN
global ann_local
ann_local = False

# parses a set of data from the arduino and issues an event to display it
def read_data(*args):
    global event_probs
    data = ""
    while True:
        root = args[0]
        # reads a block of data from the arduino
        while "&" not in data:
            data += sock.recv(BUFFER_SIZE).decode('utf-8')
        data = data.split("&", 2)
        # converts the data into a list of floats for the ANN
        result = [float(i) for i in data[0].split(",")]
        if (len(data) != 1):
            data = data[1]
        #event_lock.acquire(True)
        event_probs = result
        root.event_generate("<<socket_data>>", when="tail")
        #event_lock.release()

screen_frame = Frame(root, bg='white')
screen_frame.pack(fill=BOTH)

top_frame = Frame(screen_frame, bg='white')
top_frame.pack(side=TOP, fill=X)

label_frame = Frame(top_frame, bg='white', height=400, width=200)
label_frame.pack(side=LEFT, fill=Y)

probability_canvas = Canvas(top_frame, bg='white', height=350, width=500)
probability_canvas.pack(side=TOP, fill=Y)

thresholds = [0.9] * 9

# produces callbacks for the threshold changing buttons
def button_callback_factory(delta, gesture):
    def callback():
        thresholds[gesture] += delta
        if (thresholds[gesture] < 0.05): thresholds[gesture] = 0.5
        if (thresholds[gesture] > 1.0): thresholds[gesture] = 1.0
    return callback

gesture_text = StringVar()
gesture_text.set("Gesture: \n\n")

probability_text = StringVar()
probability_text.set("Highest\nProbability:\n\n")

gesture_label = Label(label_frame, text="Gestures: ", font="Helvetica 18 bold", anchor=W, bg='white')
gesture_label.pack(side=TOP)

# gesture names and buttons for thresholds
for gesture in range(0, 9):
    gesture_frame = Frame(label_frame, bg='white')
    button_plus = Button(gesture_frame, text="+", command=button_callback_factory(0.05, gesture))
    button_minus = Button(gesture_frame, text="-", command=button_callback_factory(-0.05, gesture))
    gesture_label = Label(gesture_frame, text=gestures[gesture], font="Ariel 16", anchor=W, justify=LEFT, bg='white')
    button_minus.pack(side=LEFT)
    button_plus.pack(side=LEFT)
    gesture_label.pack(side=LEFT)
    gesture_frame.pack(side=TOP, fill=X)

gesture_label = Label(label_frame, textvariable=probability_text, font="Ariel 16", bg='white')
gesture_label.pack()

gesture_label = Label(label_frame, textvariable=gesture_text, font="Ariel 16", bg='white')
gesture_label.pack()

global gesture_image
if animation_on:
    photo_canvas = Canvas(top_frame, bg='white', height=220, width=500);
    photo_canvas.pack(side=RIGHT)
    gesture_image = photo_canvas.create_image(150, 150, image=gestureImages[0][0])

def on_closing():
    print("Connection closed")
    sock.close()
    label_frame.quit()

root.protocol("WM_DELETE_WINDOW", on_closing)

global canvas_lock
canvas_lock = threading.Lock()

global frame
global image
frame, image = 0, 0

# animates the gesture gifs
# defunct, currently
def animation_ticker():
    global canvas_lock
    global frame
    global image
    global gesture_image
    while True:
        canvas_lock.acquire()
        if (image >= len(gestureImages)):
            image = 0
        #print frame, image
        frame = (frame + 1) % len(gestureImages[image])
        photo_canvas.itemconfig(gesture_image, image=gestureImages[image][frame])
        canvas_lock.release()
        time.sleep(0.05)

# draws the gesture statistics to the probability_canvas
def display_data(*args):
    global event_probs
    global event_lock
    global image
    global frame
    result = event_probs
    if ann_local:
        result = neural.best(result)
    m = max(result)
    max_index = result.index(m)
    probability_text.set("Highest\nProbability:\n%0.2f%%\n" % (m * 100))
    probability_canvas.delete("all")
    SCALE = 30
    for gesture in range(0,9):
        if result[gesture] > thresholds[gesture]:
            colour = "green"
        else:
            colour = "red"
        probability = probability_canvas.create_rectangle(5, 43 + gesture * SCALE, 5 + 300 * result[gesture], 63 + gesture * SCALE, fill=colour) # bar
        threshold = probability_canvas.create_line(305 * thresholds[gesture], 40 + gesture * SCALE, 305 * thresholds[gesture], 65 + gesture * SCALE) # thres
        threshold_text = probability_canvas.create_text(340, 53 + gesture * SCALE, text=str(round(result[gesture] * 100)) + "%", font="Ariel 10") # prob
        threshold_text = probability_canvas.create_text(450, 53 + gesture * SCALE, text=str((thresholds[gesture] * 100)) + "%", font="Ariel 10") # thresprob
    if m > thresholds[max_index]:
        gesture = gestures[max_index]
        gesture_text.set("Gesture: \n" + gesture + "\n")
        image = max_index
        frame = 0
        print(gesture)
    threshold_text = probability_canvas.create_text(340, 30, text="Probabilities: ", font="Ariel 12")
    threshold_text = probability_canvas.create_text(450, 30, text="Thresholds: ", font="Ariel 12")

root.bind("<<socket_data>>", display_data)

# thread to take input from the arduino
read_thread = threading.Thread(target=read_data, args=(root,))
read_thread.start()

if animation_on:
    animation_thread = threading.Thread(target=animation_ticker)
    animation_thread.start()

root.mainloop()
root.destroy()
