# Game Logic
# Draw board
# Decide who goes first
# Player takes a turn & picks from available squares
# Check to see if winner
# Check if any squares are left
# Player 2 takes a turn
# Play again?

require 'pry'

# CONSTANTS
# Lines formed that win the game
WINNING_LINES = [[1,2,3],[4,5,6],[7,8,9],[1,4,7],[2,5,8],[3,6,9],[1,5,9],[3,5,7]]

# Markers
X = "X"
O = "O"


#available spacesspace
def available_spaces(space)
  space.select {|k,v| v == " "}.keys
end

def draw_board(space)
  system 'clear'
  puts "#{space[1]}|#{space[2]}|#{space[3]}"
  puts "-----"
  puts "#{space[4]}|#{space[5]}|#{space[6]}"
  puts "-----"
  puts "#{space[7]}|#{space[8]}|#{space[9]}"
end

def player(space)
  if available_spaces(space).any?
    puts "Choose an available space from #{available_spaces(space)}."
    position = gets.chomp.to_i
      if available_spaces(space).include?(position)
        space[position] = "X"
      else
        player(space)
      end
    draw_board(space)
  end
end

def computer(line, space)
  defend_this_space = nil
  attacked = false

  #attack
  WINNING_LINES.each do |l|
    defend_this_space = two_in_a_row({1[0] => space[1[0]], 1[1] => space[1[1]], 1[2] => space[1[2]]}, O)
    if defend_this_space
      space[defend_this_space] = O
      attacked = true
      break
    end
  end

  # defend
  if attacked == false
    WINNING_LINES.each do |l|
      defend_this_space = two_in_a_row({1[0] => space[1[0]], 1[1] => space[1[1]], 1[2] => space[1[2]]}, X)
      if defend_this_space
        space[defend_this_space] = O
        attacked = true
        break
      end
    end
  end

  space[available_spaces(space).sample] = O unless defend_this_space
  draw_board(space)
end

# checks to see if two markers in a row
def two_in_a_row(hash, marker)
  if hash.values.count(marker) == 2
    hash.select{|k,v| v == " "}.keys.first
  else
    false
  end
end

# check for winner method
def check_for_winner(line, space)
  if line.find {|l| l.all? {|k| space[k] == X} }
    puts "YOU WIN!"
    true
  elsif line.find {|l| l.all? {|k| space[k] == O} }
    puts "Computer won, you LOSE!"
    true
  end
end

# play again?
play_again = "y"

while play_again == "y"

  #players stored in array so player can be chosen at random
  players = ["player", "computer"]

  #initialize the empty hash that will store the board spaces
  board_spaces = {1 => " ", 2 => " ", 3 => " ", 4 => " ", 5 => " ", 6 => " ", 7 => " ", 8 => " ", 9 => " "}

  #setting who goes first
  goes_first = players.sample

  #show players empty board
  draw_board(board_spaces)

  #the code for the game goes here
  if goes_first == 'player'
    begin
      break if check_for_winner(WINNING_LINES, board_spaces) == true
      player(board_spaces)
      break if check_for_winner(WINNING_LINES, board_spaces) == true
      computer(WINNING_LINES, board_spaces)
    end until available_spaces(board_spaces).empty?
  elsif goes_first == 'computer'
    begin
      break if check_for_winner(WINNING_LINES, board_spaces) == true
      computer(WINNING_LINES, board_spaces)
      break if check_for_winner(WINNING_LINES, board_spaces) == true
      player(board_spaces)
    end until available_spaces(board_spaces).empty?
  end

  sleep 0.5
  puts "GAME OVER."

  #play again?
  sleep 0.5
  puts "Play again? (y/n)"
  play_again = gets.chomp
end