# Pseudo Code (LOGIC)
# 1. all players pick either rock, paper, scissors, lizard, or spock
# 2. compare: paper > rock, paper > spock, rock > scissors,  rock > lizard, scissors > paper, scissors > lizard, lizard > spock, lizard > paper, spock > scissors, spock > rock, or tie if same
# 3. play again?

require 'pry'

PLAY = [ "rock", "paper", "scissors", "lizard", "spock"]

scenario = { rock: { rock: "It's a tie!", paper: "Paper covers rock!", scissors: "Rock crushes scissors!", lizard: "Rock crushes lizard!", spock: "Spock vaporizes rock!"}, 

  paper: { rock: "Paper covers rock!", paper: "It's a tie!", scissors: "Scissors cuts paper!", lizard: "Lizard eats paper!", spock: "Paper disproves Spock!"}, 

  scissors: { rock: "Rock crushes scissors!", paper: "Scissors cuts paper!", scissors: "It's a tie!", lizard: "Scissors decapitates lizard!", spock: "Spock dulls scissors!"}, 

  lizard: { rock: "Rock crushes lizard!", paper: "Lizard eats paper!", scissors: "Scissors decapitates lizard!", lizard: "It's a tie!", spock: "Lizard poisons Spock!"}, 

  spock: { rock: "Spock vaporizes rock!", paper: "Paper disproves Spock!", scissors: "Spock dulls scissors!", lizard: "Lizard poinsons Spock!", spock: "It's a tie!"}
}

puts "Let's play Rock, Paper, Scissors, Lizard, Spock!"

loop do
  begin
    puts "Please enter rock, paper, scissors, lizard, or Spock."
    player = gets.chomp.downcase
  end until PLAY.include?(player)
  
  human = player.to_sym
  computer = PLAY.sample.to_sym
  
  puts "You picked #{human}."
  puts "Computer picked #{computer}."

  puts scenario[human][computer]

  puts "Would you like to play again? Enter 'y' for yes, any other key to exit."
  break if gets.chomp.downcase != 'y'
end

puts "Thank you for playing."