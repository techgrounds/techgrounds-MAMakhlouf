import random

# Function to check the validity of a move
def is_valid_move(move):
    valid_moves = ["rock", "paper", "scissors"]
    return move.lower() in valid_moves

# Function to generate the computer's move
def generate_computer_move():
    moves = ["rock", "paper", "scissors"]
    return random.choice(moves)

# Function to determine the winner of each round
def get_round_winner(player_move, computer_move):
    if player_move == computer_move:
        return "tie"
    elif (
        (player_move == "rock" and computer_move == "scissors") or
        (player_move == "paper" and computer_move == "rock") or
        (player_move == "scissors" and computer_move == "paper")
    ):
        return "player"
    else:
        return "computer"

# Function to keep track of the score
def play_game(rounds):
    player_score = 0
    computer_score = 0

    for round_num in range(1, rounds + 1):
        print("Round", round_num)
        
        # Player's move
        player_move = input("Enter your move (rock, paper, or scissors): ")
        
        # Check validity of player's move
        while not is_valid_move(player_move):
            print("Invalid move. Please enter rock, paper, or scissors.")
            player_move = input("Enter your move (rock, paper, or scissors): ")
        
        # Generate computer's move
        computer_move = generate_computer_move()
        print("Computer's move:", computer_move)
        
        # Determine the winner of the round
        round_winner = get_round_winner(player_move, computer_move)
        
        if round_winner == "player":
            print("You win this round!")
            player_score += 1
        elif round_winner == "computer":
            print("Computer wins this round!")
            computer_score += 1
        else:
            print("It's a tie!")
        
        print()  # Print an empty line for clarity

    # Print the final score
    print("Final score:")
    print("Player:", player_score)
    print("Computer:", computer_score)

# Play the game with 5 rounds
play_game(5)
        