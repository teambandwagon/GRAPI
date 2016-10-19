import pygame
import time
from random import randint

black = (0, 0, 0)
white = (255, 255, 255)
red = (255, 0, 0)
green = (0, 255, 0)
blue = (0, 0, 255)

# names of gestures, indexed by the output neurons indices
gestures = ["Idle", "Push", "Pull", "Dragleft", "Dragright", "Hit", "Lift", "Screwin", "Screwout"]

global head_x
global head_y
global head_x_change
global head_y_change
global food_x
global food_y
global score
global gameDisplay
global font
global gesture

gesture = ""

block_size = 40

head_x = 400
head_y = 280

head_x_change = 0
head_y_change = 0

food_x = round(randint(60, 740)/block_size)*block_size
food_y = round(randint(80, 520)/block_size)*block_size

score = 0

def message_to_screen(score, color):
    global gameDisplay
    global font
    screen_text = font.render("Score: {}".format(score), True, color)
    gameDisplay.blit(screen_text, [30, 15])
    return

def draw_screen():
    global gameDisplay
    global head_x
    global head_y
    
    gameDisplay.fill(white)

    #pygame.draw.line(gameDisplay, black, [20,40], [780,40], 1)
    #pygame.draw.line(gameDisplay, black, [20,560], [780,560], 1)
    #pygame.draw.line(gameDisplay, black, [20,40], [20,560], 1)
    #pygame.draw.line(gameDisplay, black, [780,40], [780,560], 1)
    #pygame.draw.rect(gameDisplay, black, (head_x, head_y, block_size, block_size))
    #pygame.draw.rect(gameDisplay, green, (food_x, food_y, block_size, block_size))

    #message_to_screen(score, black)

    screen_text = font.render("Gesture Likeliness:", True, black)
    gameDisplay.blit(screen_text, [30, 30])
    screen_text = font.render("Threshold: 90%", True, black)
    gameDisplay.blit(screen_text, [290, 30])
    pygame.draw.line(gameDisplay, red, [130 + 250 * 0.90,56], [130 + 250 * 0.90,189], 1)
    for i in range(0,9): 
        screen_text = font.render(gestures[i], True, black)
        gameDisplay.blit(screen_text, [30, 55 + i * 15])
    screen_text = font.render("Gesture: " + gesture, True, black)
    gameDisplay.blit(screen_text, [30, 200])

    pygame.draw.line(gameDisplay, black, [30,240], [420,240], 1)
    pygame.draw.line(gameDisplay, black, [30,520], [420,520], 1)
    pygame.draw.line(gameDisplay, black, [30,240], [30,520], 1)
    pygame.draw.line(gameDisplay, black, [420,240], [420,520], 1)

    pygame.display.update()

    for event in pygame.event.get():
            if event.type == pygame.QUIT:
                done = True
    return

def start_game():
    global gameDisplay
    global font
    pygame.init()

    screenSize = (450, 550)
    gameDisplay = pygame.display.set_mode(screenSize)
    pygame.display.set_caption('GRAPI')

    font = pygame.font.SysFont(None, 25)

    clock = pygame.time.Clock()
    clock.tick(60)

    draw_screen()
    return

def check_eat():
    global head_x
    global head_y
    global food_x
    global food_y
    global score
    if head_x == food_x and head_y == food_y:
        food_x = round(randint(20, 760)/block_size)*block_size
        food_y = round(randint(80, 560)/block_size)*block_size
        score += 1
    return

def set_gesture(name):
    global gesture
    gesture = name
    return

def show_percentages(data):
    global gameDisplay
    global font
    gameDisplay.fill(white)
    
    screen_text = font.render("Gesture Likeliness:", True, black)
    gameDisplay.blit(screen_text, [30, 30])
    screen_text = font.render("Threshold: 90%", True, black)
    gameDisplay.blit(screen_text, [290, 30])
    pygame.draw.line(gameDisplay, red, [130 + 250 * 0.90,56], [130 + 250 * 0.90,189], 1)
    for i in range(0,9): 
        screen_text = font.render(gestures[i], True, black)
        gameDisplay.blit(screen_text, [30, 55 + i * 15])
        pygame.draw.rect(gameDisplay, red, (130, 56 + i * 15, 250 * data[i], 13))
    screen_text = font.render("Gesture: " + gesture, True, black)
    gameDisplay.blit(screen_text, [30, 200])

    pygame.draw.line(gameDisplay, black, [30,240], [420,240], 1)
    pygame.draw.line(gameDisplay, black, [30,520], [420,520], 1)
    pygame.draw.line(gameDisplay, black, [30,240], [30,520], 1)
    pygame.draw.line(gameDisplay, black, [420,240], [420,520], 1)
    
    pygame.display.update()
    for event in pygame.event.get():
            if event.type == pygame.QUIT:
                done = True
    return

def move_left():
    global head_x
    if head_x > 80:
        head_x -= block_size
    check_eat()
    draw_screen()
    return

def move_right():
    global head_x
    if head_x < 700:
        head_x += block_size
    check_eat()
    draw_screen()
    return

def move_up():
    global head_y
    if head_y > 100:
        head_y -= block_size
    check_eat()
    draw_screen()
    return

def move_down():
    global head_y
    if head_y < 500:
        head_y += block_size
    check_eat()
    draw_screen()
    return

def stop_game():
    pygame.quit()
    return

def start_game_do_not_use():

    global gameDisplay

    clock = pygame.time.Clock()

    done = False

    while not done:
        for event in pygame.event.get():
            if event.type == pygame.QUIT:
                done = True
            if event.type == pygame.KEYDOWN:
                if event.key == pygame.K_LEFT:
                    head_x_change = -block_size
                    head_y_change = 0
                if event.key == pygame.K_RIGHT:
                    head_x_change = block_size
                    head_y_change = 0
                if event.key == pygame.K_UP:
                    head_x_change = 0
                    head_y_change = -block_size
                if event.key == pygame.K_DOWN:
                    head_x_change = 0
                    head_y_change = block_size

        head_x += head_x_change
        if head_x < 10 or head_x > 770:
            head_x = 400
            head_y = 300
            food_x = round(randint(20, 760)/block_size)*block_size
            food_y = round(randint(80, 560)/block_size)*block_size
            score = 0
            head_x_change = 0
        head_y += head_y_change
        if head_y < 50 or head_y > 570:
            head_x = 400
            head_y = 300
            food_x = round(randint(20, 760)/block_size)*block_size
            food_y = round(randint(80, 560)/block_size)*block_size
            score = 0
            head_y_change = 0

        if head_x == food_x and head_y == food_y:
            food_x = round(randint(20, 760)/block_size)*block_size
            food_y = round(randint(80, 560)/block_size)*block_size
            score += 1

        gameDisplay.fill(white)

        pygame.draw.line(gameDisplay, black, [20,60], [780,60], 1)
        pygame.draw.line(gameDisplay, black, [20,580], [780,580], 1)
        pygame.draw.line(gameDisplay, black, [20,60], [20,580], 1)
        pygame.draw.line(gameDisplay, black, [780,60], [780,580], 1)
        pygame.draw.rect(gameDisplay, black, (head_x, head_y, block_size, block_size))
        pygame.draw.rect(gameDisplay, green, (food_x, food_y, block_size, block_size))
        
        message_to_screen(score, black)
        
        pygame.display.update()

        time.sleep(1/10)

    pygame.quit()
    return

