play_game <- function() {
  print("Welcome to rock paper scissor game!")
  print("Instruction: type 'exit' to exit the game")
  
  options <- c("hammer", "scissor", "paper")
  print(options)
  
  score <- 0  
  while ( TRUE){
  user_select <- readline("Choose one: ")
  computer_select <- sample(options, 1)
  
  if (user_select == computer_select ) {
    print ("tie!!") 
    
  } else if (user_select == "hammer" & computer_select == "scissor"){
    score <- score + 1 
    print("win!!" ) 
  } else if (user_select == "hammer" & computer_select == "paper"){
    print("lose!!")
    
  } else if (user_select == "scissor" & computer_select == "hammer"){
    print("lose!!")
  } else if (user_select == "scissor" & computer_select == "paper"){
    score <- score + 1 
    print("win!!")
    
  } else if (user_select == "paper" & computer_select == "hammer"){
    score <- score + 1 
    print("win!!")
  } else if (user_select == "paper" & computer_select == "scissor"){
    print("lose!!")
  }
  
  text = readline("Do you want to continue?")
  if (text == "exit"){
    print("Thank you for playing game. ")
    break
  } else {
    print(options)
  }
  }
  print ( paste ("Total score:", score))
}
