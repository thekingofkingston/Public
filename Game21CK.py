#!/user/bin/env python3                                                                     # Required Shegang
import random                                                                               # import dice package
import time                                                                                 # import wait package
print("Welcome to the game of 21")                                                          # Introduction & rules
time.sleep(1)                                                                               # pretend to think
print()                                                                                     # space added
print("You and I will roll two dice to start. I will tell you the results.")                # intro continued
time.sleep(1)                                                                               # pretend to think
print()                                                                                     # space added
print("Beat my rolls and you win the game. We'll play three out of five")                   # intro continued
time.sleep(1)                                                                               # pretend to think
print()                                                                                     # space added
print("After the first round I will give you the option to roll again.")                    # intro continued
time.sleep(1)                                                                               # pretend to think
print()                                                                                     # space added
print("To be fair, I will also have a chance to roll again if I think I can do better.")    # intro continued
time.sleep(1)                                                                               # pretend to think
print()                                                                                     # space added
print("However, like black jack, going over 21 is a bust and you will lose if you go over.")  # intro continued
time.sleep(1)                                                                               # pretend to think
print()                                                                                     # space added
print("Don't forget, that the goal it to beat my rolls, so no ties!")                       # intro continued
time.sleep(1)                                                                               # pretend to think
play_again = "y"                                                                            # setup
roll_again = "y"                                                                            # setup continues
p_score = 0                                                                                 # set starting player score
c_score = 0                                                                                 # computer score set
game_number = 0                                                                             # number of games played
c_wins = 0                                                                                  # number od computer wins
p_wins = 0                                                                                  # number of player wins
c_turn = 1                                                                                  # set computer turn
p_turn = 1                                                                                  # set player turn
while c_wins != 3 or p_wins != 3:
    game_number = game_number+1                                                             # Advance game number
    time.sleep(1)                                                                           # pretend to think
    print(f"\nGame: {game_number}")                                                         # State game number
    print()                                                                                 # space added
    play_again = input("Would you like to play? 'y' for yes and 'n' for no\n")
    if play_again != "y":
        print("Good luck next time!")
        exit()
    else:
        print("Don't forget you need to beat me three times to win")
        print()
        print(f"\nLet's roll..\n\nGood luck!")                                              # feedback & cheer
        print()                                                                             # space added
        if p_score == 0:
            print(f"Player turn {p_turn}!\n")                                               # first turn announced
            time.sleep(3)                                                                   # pretend to think
            die_1 = random.randint(1, 6)                                                    # player's first die roll
            die_2 = random.randint(1, 6)                                                    # player's second die roll
            play_roll = die_1 + die_2                                                       # player's total rolled
            print("You rolled a", die_1, "and a", die_2, "for a total of",
                  play_roll)                                                                # player's new roll total
            time.sleep(2)                                                                   # pretend to think
            print(f"My turn {c_turn}")                                                      # computer first turn text
            die_3 = random.randint(1, 6)                                                    # computer's first die roll
            die_4 = random.randint(1, 6)                                                    # computer's second die roll
            comp_roll = die_3 + die_4                                                       # computer's total rolled
            time.sleep(3)                                                                   # pretend to think
            print("I rolled a", die_3, "and a", die_4, "for a total of",
                  comp_roll)                                                                # computer's new roll total
            while roll_again == "y":
                roll_again = input(f"\n\nWould you like you roll again and better your total?"
                                   "   'y' for yes or 'n' for no.\n")                       # Score update & roll again?
                if roll_again == "y":                                                       # if yes to roll
                    print("\nConfident aren't you. That's what I like to hear!")            # feedback & cheer
                    die_5 = random.randint(1, 6)                                            # another roll
                    time.sleep(3)                                                           # pretend to think
                    p_score = (die_5+p_score)                                               # update player's score
                    print("You rolled a", die_5, "for a new total of", p_score)             # player's new roll total
                    p_turn = (p_turn+1)                                                     # advance player turn
                else:
                    print("That's too bad. I was rooting for you all along!")               # player chooses not to roll
            while c_score < 16 and p_score > c_score:                                       # computer rolling loop
                if c_score > 16:                                                            # computer hedge risk
                    print(f"I will keep my rolls totaling {c_score} and not roll, but good luck!")
                elif c_turn < p_turn:                                                       # computer takes risk
                    print("\n\nI can do better than that.\n\nI want to roll again!")        # computer feedback
                    die_5 = random.randint(1, 6)                                            # another roll
                    time.sleep(3)                                                           # pretend to think
                    c_score = c_score+die_5                                                 # Update computer's rolls
                    print("I rolled a", die_5, "for a new total of",
                          c_score)                                                          # computer's new roll total
                    c_turn = (c_turn+1)                                                     # advance computer turn
        else:
            if roll_again != "y":                                                           # if no want roll
                if p_score > 21:                                                            # if player bust
                    print("\nBust!\nYou lost. Better luck next time.")                      # bust message
                    c_wins = c_wins + 1                                                     # increase computer score
                    score = 0                                                               # set starting player score
                    c_score = 0                                                             # computer score set
                else:
                    if p_score > c_score:
                        print(f"\nYou have a score of {p_score} to my {c_score}.\n\nYou won!")
                        p_wins = p_wins + 1                                                 # update player's scores
                        print()
                        print("That was just luck! Remember, we play three out of five. Let's play again.")
                        score = 0                                                           # set starting player score
                        c_score = 0                                                         # computer score set
                    elif c_score > p_score:
                        print(f"\nYou have a score of {p_score} to my {c_score}.\n\nYou won!")
                        c_wins = c_wins + 1                                                 # update player's scores
                        print()
                        print("Bad luck! Remember, we play three out of five.")
                        score = 0                                                           # set starting player score
                        c_score = 0                                                         # computer score set
            else:
                print()                                                                     # Not sure yet (maybe 21)
