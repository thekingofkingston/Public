#!/user/bin/env python3                                                         # Required Shegang
import random                                                                   # import package

user_action = input("Enter a choice (rock, paper, scissors): ")                 # game introduction
possible_actions = ["rock", "paper", "scissors"]                                # player selection
computer_action = random.choice(possible_actions)                               # computer selection
print(f"\nYou chose {user_action}, computer chose {computer_action}.\n")        # present choices

if user_action == computer_action:                                              # if computer and player select the same
    print(f"Both players selected {user_action}. It's a tie!")                  # result of tie
elif user_action == "rock":                                                     # if player chose rock
    if computer_action == "scissors":                                           # if computer chose scissors to player
        print("Rock smashes scissors! You win!")                                # rock > scissors result
    else:                                                                       # if computer chose paper to player
        print("Paper covers rock! You lose.")                                   # rock < paper result
elif user_action == "paper":                                                    # if player chose paper
    if computer_action == "rock":                                               # if computer chose rock to player
        print("Paper covers rock! You win!")                                    # paper > rock result
    else:                                                                       # if computer chose scissors to player
        print("Scissors cuts paper! You lose.")                                 # paper < scissors result
elif user_action == "scissors":                                                 # if player chose scissors
    if computer_action == "paper":                                              # if computer chose paper to player
        print("Scissors cuts paper! You win!")                                  # scissors > paper result
    else:                                                                       # if computer chose rock to player
        print("Rock smashes scissors! You lose.")                               # scissors < rock result
        