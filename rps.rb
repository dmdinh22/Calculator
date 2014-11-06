# Pseudo Code (LOGIC)
# 1. all players pick either rock, paper, or scissors
# 2. compare: paper > rock, rock > scissors, scissors > paper, or tie if same
# 3. play again?

ACTIONS = { 'r' => 'rock', 'p' => 'paper', 's' => 'scissors' }

def winning_message(action)
  case action
    when 'r'
      puts "Rock smashes scissors."
    when 'p'
      puts "Paper suffocates rock."
    when 's'
      puts "Scissors snips paper."
    end
end


loop do 
  begin
  puts "Choose 'r' for rocks, 'p' for paper, or 's' for scissors."
  player_action = gets.chomp.downcase
  end until ACTIONS.keys.include?(player_action)
  computer_action = ACTIONS.keys.sample
  if player_action == computer_action
    puts "It's a tie!"
  elsif player_action == 'r' && computer_action == 's'
    winning_message(player_action)
    puts "You won!"
  elsif player_action == 'p' && computer_action == 'r'
    winning_message(player_action)
    puts "You won!"
  elsif player_action == 's' && computer_action == 'p'
    winning_message(player_action)
    puts "You won!"
  else
    winning_message(computer_action)
    puts "Computer beat you!"
  end
  puts "Would you like to keep playing? (y/n)"
  break if gets.chomp.downcase != 'y'
end

puts "Thanks for playing Rock, Paper, Scissors. Have a great day!"