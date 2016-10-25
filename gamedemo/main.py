import socket
from tkinter import *
import threading
import time
from queue import Queue # THIS NEEDS TO CHANGE FOR PYTHON 3 (no capital on the first one)

from pong import *

# whether we have two human players (otherwise AI)
two_player = False

# server for the GRAPI pong demo

port_1 = 9877
port_2 = 9876

BUFFER_SIZE = 1024 * 8

# names of gestures, indexed by the output neurons indices
gestures = ["Idle", "Push", "Pull", "Dragleft", "Dragright", "Hit", "Lift", "Screwin", "Screwout"]
IDLE = 0
PUSH = 1
PULL = 2
DRAGLEFT = 3
DRAGRIGHT = 4
HIT = 5
LIFT = 6
SCREWIN = 7
SCREWOUT = 8

# IP of host
addr = ''

# probability threshold
prob_thresh = 0.8


def connect(port, addr = ''):
    # makes a server socket
    s = socket.socket(socket.AF_INET, socket.SOCK_STREAM)
    s.setsockopt(socket.SOL_SOCKET, socket.SO_REUSEADDR, 1)
    s.bind((addr, port))
    s.listen(1)
    # waits until something connects to us
    print("waiting on port", port)
    (sock, clientAddress) = s.accept()
    print("connection accepted from", clientAddress)
    return sock


global event_queue
event_queue = Queue()

global end_lock_lock
end_lock_lock = threading.Lock()
global end_lock
end_lock = threading.Lock()

def check_end_lock():
    end_lock_lock.acquire(True)
    isTrue = False
    if (end_lock.acquire(False)):
        end_lock.release()
        isTrue = True
    end_lock_lock.release()
    return isTrue

# 'fakes' gesture data to control one of the paddles
def ai_player(*args):
    global event_queue
    global end_lock_lock
    root = args[0]
    world = args[1]
    player = args[2]
    while check_end_lock():
        time.sleep(1)
        if (world.ball.y > world.paddles[1].y):
            event_queue.put(([0 if i != world.move_down[player] else 1 for i in range(9)], 1))
        elif (world.ball.y <= world.paddles[1].y + Paddle.SIZE):
            event_queue.put(([0 if i != world.move_up[player] else 1 for i in range(9)], 1))

# reads a set of data from the arduino
def read_data(*args):
    global event_queue
    global end_lock_lock
    root = args[0]
    sock = args[1]
    player = args[2]
    while check_end_lock():
        # reads a block of data from the arduino
        data = ""
        while "&" not in data:
            d = sock.recv(BUFFER_SIZE).decode('utf-8')
            data += d
            if len(d) == 0:
                print("player " + str(player) + " lost connection")
                return
        data = data.replace("&", "")
        # converts the data into a list of floats
        data = [float(i) for i in data.split(",")]
        result = data
        event_queue.put((result, player))
    print("player " + str(player) + " ended")


s_1 = connect(port_1)

print("opening TK")
root = Tk()
root.title("GRAPI")

read_thread_1 = threading.Thread(target=read_data, args=(root, s_1, 0))
read_thread_1.start()

if two_player:
    s_2 = connect(port_2)

screen_frame = Frame(root, bg='white')
screen_frame.pack()

top_frame = Frame(screen_frame, bg='white')
scoreLabels = [
    Label(top_frame, text="0", bg='white', font=("Comic Sans", 25)),
    Label(top_frame, text="0", bg='white', font=("Comic Sans", 25))
]
scoreLabels[0].pack(side=LEFT)
scoreLabels[1].pack(side=RIGHT)
top_frame.pack(fill=X, side=TOP)

def upcallback_factory(player, gesture):
    def callback():
        worldState.move_up[player] = gesture
    return callback

def downallback_factory(player, gesture):
    def callback():
        worldState.move_down[player] = gesture
    return callback

button_frame_1 = Frame(root, bg='white', height=420)
button_frame_1.pack(side=LEFT, fill=Y)
for gesture in range(9)[::-1]:
    button_frame = Frame(button_frame_1, bg='white')
    Button(button_frame, text="U", height=2, command=upcallback_factory(0, gesture)).pack(side=LEFT)
    Button(button_frame, text="D", height=2, command=upcallback_factory(0, gesture)).pack(side=LEFT)
    button_frame.pack(side=BOTTOM, fill=Y)
player_canvas_1 = Canvas(root, bg='white', height=420, width = 250)
player_canvas_1.pack(side=LEFT, fill=Y)
display_canvas = Canvas(root, bg='gray', height=420, width=650)
display_canvas.pack(side=LEFT, fill=Y)
player_canvas_2 = Canvas(root, bg='white', height=420, width = 250)
player_canvas_2.pack(side=LEFT, fill=Y)
button_frame_2 = Frame(root, bg='white', height=420)
for gesture in range(9)[::-1]:
    button_frame = Frame(button_frame_2, bg='white')
    Button(button_frame, text="U", height=2, command=upcallback_factory(1, gesture)).pack(side=LEFT)
    Button(button_frame, text="D", height=2, command=upcallback_factory(1, gesture)).pack(side=LEFT)
    button_frame.pack(side=BOTTOM, fill=Y)
button_frame_2.pack(side=LEFT, fill=Y)

def on_closing():
    print("Connection closed")
    root.quit()
    end_lock.acquire(True)

root.protocol("WM_DELETE_WINDOW", on_closing)

global worldState
worldState = WorldState([LIFT, LIFT], [SCREWIN, SCREWIN])

global scores
scores = [0, 0]

# draws the side gesture charts
def draw_probs(result, canvas):
    canvas.delete("all")
    m = max(result)
    max_index = result.index(m)
    for i in range(0,9):
        if i == max_index and m > prob_thresh:
            colour = "green"
        else:
            colour = "red"
        canvas.create_rectangle(30, 67 + i * 40, 30 + 170 * result[i], 85 + i * 40, fill=colour)
        canvas.create_text(180, 60 + i * 40, text="%0.5f%%" % result[i], font="Ariel 10")
        canvas.create_text(30, 58 + i * 40, text=gestures[i], font="Ariel 14", anchor='w')

# handles gestures
def handle_gesture(*args):
    time.sleep(1)
    global event_queue
    while True:
        result, player = event_queue.get()
        if not worldState.running: continue
        m = max(result)
        if m > prob_thresh:
            max_index = result.index(m)
            worldState.process(max_index, player)
            worldState.draw(display_canvas)
        draw_probs(result, player_canvas_1 if player == 0 else player_canvas_2)

# updates the balls position
def ticker():
    if check_end_lock():
        state = worldState.tick()
        if (state == -1):
            pass
        else:
            scores[state] += 1
            scoreLabels[state]['text'] = str(scores[state])
            worldState.reset()
        worldState.draw(display_canvas)
        timer = threading.Timer(0.015, ticker)
        timer.start()

read_thread_2 = threading.Thread(target=read_data if two_player else ai_player,args=(root, s_2 if two_player else worldState, 1))
read_thread_2.start()

display_thread = threading.Thread(target=handle_gesture, args=())
display_thread.start()

ticker()

worldState.running = True

root.mainloop()
root.destroy()
