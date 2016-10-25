import threading
import random

class Paddle(object):
    MAX_Y = 8
    MIN_Y = 1
    SIZE = 4
    JUMP_SIZE = 4
    def __init__(self, location, delta):
        self.x = location
        self.y = 5
        self.delta = delta
    def move_up(self):
        self.y -= Paddle.JUMP_SIZE
        if (self.y < Paddle.MIN_Y):
            self.y = Paddle.MIN_Y
    def move_down(self):
        self.y += Paddle.JUMP_SIZE
        if (self.y > Paddle.MAX_Y):
            self.y = Paddle.MAX_Y
    def draw(self, canvas):
        if self.x != 2:
            canvas.create_polygon(
                self.x * SCALE, self.y * SCALE,
                self.x * SCALE, (self.y + Paddle.SIZE) * SCALE,
                (self.x + 1) * SCALE, (self.y + Paddle.SIZE / 2) * SCALE,
                fill="blue")
        else:
            canvas.create_polygon(
                (self.x + 1) * SCALE, self.y * SCALE,
                (self.x + 1) * SCALE, (self.y + Paddle.SIZE) * SCALE,
                (self.x) * SCALE, (self.y + Paddle.SIZE / 2) * SCALE,
                fill="blue")            
    def collision(self, x, y):
        if (x == self.x + self.delta and y >= self.y - 1 and y <= self.y + Paddle.SIZE):
            return True
        else:
            return False

class Ball(object):
    def __init__(self, x, y):
        self.x = x
        self.y = y
        self.dx = -1 if random.Random().randrange(2) == 0 else 1
        self.dy = -1 if random.Random().randrange(2) == 0 else 1
        self.ticker = 0
    def tick(self):
        if self.ticker < SCALE:
            self.ticker += 4
            return -1
        self.x += self.dx
        self.y += self.dy
        self.ticker = 0
        if self.y < Paddle.MIN_Y or self.y >= Paddle.MAX_Y + Paddle.SIZE:
            self.collision_y()
        if self.x < 1:
            return 1
        elif self.x > 19:
            return 0
        else:
            return -1
    def draw(self, canvas):
        ux = self.ticker * self.dx
        uy = self.ticker * self.dy
        canvas.create_oval(
            self.x * SCALE + ux, self.y * SCALE + uy,
            (self.x + 1) * SCALE + ux, (self.y + 1) * SCALE + uy,
            fill="red")
    def collision_x(self):
        if (self.ticker == 0):
            self.dx = -self.dx
    def collision_y(self):
        self.dy = -self.dy

# display scaling
SCALE = 32
class WorldState(object):
    # controls
    def __init__(self, move_up, move_down):
        self.lock = threading.Lock()
        self.move_up = move_up
        self.move_down = move_down
        self.reset()
        self.running = False
    def process(self, gesture, player):
        self._lock()
        if (gesture == self.move_up[player]):
            self.paddles[player].move_up()
        elif (gesture == self.move_down[player]):
            self.paddles[player].move_down()
        self._unlock()
    def draw(self, canvas):
        self._lock()
        canvas.delete("all")
        for paddle in self.paddles:
            paddle.draw(canvas)
        self.ball.draw(canvas)
        self._unlock()
    def reset(self):
        self._lock()
        self.paddles = [Paddle(2, 1), Paddle(17, -1)]
        self.ball = Ball(9, random.Random().randrange(8) + 1)
        self._unlock()
    def tick(self):
        self._lock()
        r = self.ball.tick()
        for paddle in self.paddles:
            if paddle.collision(self.ball.x, self.ball.y):
                self.ball.collision_x()
                break
        self._unlock()
        return r
    def _lock(self):
        self.lock.acquire(True)
    def _unlock(self):
        self.lock.release()
