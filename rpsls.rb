# Pseudo Code (LOGIC)
# 1. all players pick either rock, paper, scissors, lizard, or spock
# 2. compare: paper > rock, paper > spock, rock > scissors,  rock > lizard, scissors > paper, scissors > lizard, lizard > spock, lizard > paper, spock > scissors, spock > rock, or tie if same
# 3. play again?

PLAY = {'r' => 'rock', 'p' => 'paper', 's' => 'scissors', 'l' => 'lizard', 'sp' => 'spock'}

def print_out_result_message(player_action, computer_action)
  puts "You chose #{player_action} and computer chose #{computer_action}"
  if player_action == computer_action
    puts "It's a tie."
  elsif player_action == 'r' && computer_action == 's'
    puts "Your rock crushes computer's scissors."
  elsif player_action == 'r' && computer_action == 'l'
    puts "Your rock crushes computer's lizard."
  elsif player_action == 'p' && computer_action == 'r'
    puts "Your paper covers computer's rock."
  elsif player_action == 'p' && computer_action == 'sp'
    puts "Your paper disproves computer's Spock."
  elsif player_action == 's' && computer_action == 'p'
    puts "Your scissors cuts computers paper."
  elsif player_action == 's' && computer_action == 'l'
    puts "Your scissors decapitates computer's lizard."
  elsif player_action == 'l' && computer_action == 'sp'
    puts "Your lizard eats computer's paper."
  elsif player_action == 'l' && computer_action == 'p'
    puts "Your lizard poisons computer's Spock."
  elsif player_action == 'sp' && computer_action == 's'
    puts "Your Spock smashes computer's scissors."
  elsif player_action == 'sp' && computer_action == 'r'
    puts "Your Spock vaporizes computer's rock."
  else 
    puts "Computer won!"
  end
end

puts "Let's play Rock, Paper, Scissors, Lizard, Spock!"

loop do
  begin
  puts "Please enter 'r' for rock, 'p' for paper, 's' for scissors, 'l' for lizard, and 'sp' for Spock."
  player_action = gets.chomp.downcase
  end until PLAY.keys.include?(player_action)

  computer_action = PLAY.keys.sample
  print_out_result_message(player_action, computer_action)
  puts "Would you like to play again? Enter 'y' for yes, any other key to exit."
  break if gets.chomp.downcase != 'y'
end

puts "Thank you for playing."