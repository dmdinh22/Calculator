# Pseudo Code (LOGIC)
# 1. all players pick either rock, paper, or scissors
# 2. compare: paper > rock, rock > scissors, scissors > paper, or tie if same
# 3. play again?

require 'pry'
# Available actions
ACTIONS = {'r' => 'Rock', 'p' => 'Paper', 's' => 'Scissors'}

puts "Play Rock, Paper, Scissors!"

def winning_message(winning_choice)
  case winning_choice
  when 'p'
    puts "Paper suffocates rock!"
  when 'r'
    puts "Rock breaks scissors!"
  when 's'
    puts "Scissors snips paper!"
  end
end

loop do 
  begin
    puts "Please choose 'r' for Rock, 'p' for Paper, or 's' Scissors."
    player_pick = gets.chomp.downcase
  end until ACTIONS.keys.include?(player_pick)
  computer_pick = ACTIONS.keys.sample
  if player_pick == computer_pick
    puts "You tied!"
  elsif player_pick == 'r' && computer_pick == 's'
    winning_message(player_pick)
    puts "You win!"
  elsif player_pick == 'p' && computer_pick == 'r'
    winning_message(player_pick)
    puts "You win!"
  elsif player_pick == 's' && computer_pick == 'p'
    winning_message(player_pick)
    puts "You win!"
  else
    winning_message(computer_pick)
    puts "Computer beat you!"
  end
  puts "Would you like to play Rock, Paper, Scissors again? (y/n)"
  break if gets.chomp.downcase != 'y'
end

puts "Thanks for playing Rock, Paper, Scissors. Have a great day!"

