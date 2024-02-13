## Pao ying chub game
game <- function() {
  # Define the gestures
  gesture = c("Rock", "Paper", "Scissors")
  
  # Print a welcome message and get the player's name
  print("Rock, Paper, Scissors game!")
  player_name = readline("What is your name: ")
  print(paste("Hello", player_name))
  
  # Get the victory score
  victory_score = as.numeric(readline("Please enter victory score: "))
  
  # Initialize the player and computer scores
  player_score = 0
  com_score = 0
  
  # Start the game loop
  while (TRUE) {
    
    # Generate the computer's gesture
    com_gesture = sample(gesture, 1)
    
    # Get the player's gesture
    player_gesture = readline("Please enter gesture(Rock, Paper, Scissors) ")
    print(paste("Bot gesture :", com_gesture))
    
    # Validate the player's gesture
    while (player_gesture != "Rock" & player_gesture != "Paper" & player_gesture != "Scissors") {
      print("Invalid gesture. Please enter Rock, Paper, or Scissors.")
      player_gesture = readline("Please enter gesture(Rock, Paper, Scissors) ")
    }
    
    # Update the scores based on the winner
    if (player_gesture == "Rock" & com_gesture == "Scissors") {
      player_score = player_score + 1
      print("You win this round")
    } else if (player_gesture == "Paper" & com_gesture == "Rock") {
      player_score = player_score + 1
      print("You win this round")
    } else if (player_gesture == "Scissors" & com_gesture == "Paper") {
      player_score = player_score + 1
      print("You win this round")
    } else if (player_gesture == "Rock" & com_gesture == "Paper") {
      com_score = com_score + 1
      print("You lose this round")
    } else if (player_gesture == "Paper" & com_gesture == "Scissors") {
      com_score = com_score + 1
      print("You lose this round")
    } else if (player_gesture == "Scissors" & com_gesture == "Rock") {
      com_score = com_score + 1
      print("You lose this round")
    } else if (player_gesture == tolower(com_gesture)) {
      print("Draw")
    }
    
    # Clear the console after each round
    flush.console()
    
    # Check if the game is over
    if (player_score == victory_score | com_score == victory_score) {
      break
    }
  }
  
  # Determine the winner
  if (player_score > com_score) {
    print(paste(player_name, "Victory!"))
  } else {
    print("You lose!")
  }
}
game()
