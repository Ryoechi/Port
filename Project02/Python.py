import random
def game():
  print("Hello, welcome to the game")
  username = input("what is your name?: ")
  print(f"Hi {username}")
  round = int(input("How many winning rounds do you want to play?: "))
  print(f"Ok, you will play {round} rounds")
  print("Let's start the game")
  player_win = 0
  bot_win  = 0
  hand = ["rock", "paper", "scissors"]
  
  while player_win < round and bot_win < round:
    bot_hand = random.choice(hand)
    def player_choice():
      choice = input("Please choose your hand(rock, paper, scissors): ").lower()
      if choice in hand:
        print(f"You choose {choice}")
        return choice
      else: 
        print("invalide input")
        player_choice()        
    player_hand = player_choice()
    print(f"Bot choose {bot_hand}")
    
    winning_conditions = {
      ("rock", "scissors"): "Your win",
      ("paper", "rock"): "Your win",
      ("scissors", "paper"): "Your win",
    }
    
    losing_conditions = {
      ("rock", "paper"): "Your lose",
      ("paper", "scissors"): "Your lose",
      ("scissors", "rock"): "Your lose",
    }

    result = winning_conditions.get((player_hand, bot_hand))
    if not result:  # if not found in winning conditions, check losing conditions
        result = losing_conditions.get((player_hand, bot_hand))
    
    if result == "Your win":
        player_win += 1
    elif result == "Your lose":
        bot_win += 1
  
    if result:  
      print(result)
    else: 
      print("Draw")
    print(f"Player: {player_win} | Bot: {bot_win}")

  if player_win == round:
    print("You win the game")
  else:
    print("You lose the game")
  
# manual end game
  def end_game(): 
    user_end_input = input("Do you want to end the game? (yes/no): ").lower()
    if user_end_input == "yes":
      print("Thank you for playing the game")
    elif user_end_input == "no":
      game()
    else:
      print(f"Invalid input: {end_game}, please try again")
      end_game()
      
  end_game()   
    
game()
