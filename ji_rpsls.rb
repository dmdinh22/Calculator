PLAY = {'r' => 'rock', 'p' => 'paper', 's' => 'scissors', 'l' => 'lizard', 'sp' => 'spock'}

def announce_hands(play, computer_action)
  puts "you picked #{PLAY[play]}, and...computer picked #{PLAY[computer_action]}"
end

def compare_hands(player_hand, computer_hand)
  if (player_hand == 'r' && computer_hand == 'p') || (player_hand == 's' && computer_hand == 'r') # just an example
    puts "you lost"
  else
    puts "you win!"
  end
end


puts "Let's play Rock, Paper, Scissors, Lizard, Spock!"

loop do
  begin
  puts "Please enter 'r' for rock, 'p' for paper, 's' for scissors, 'l' for lizard, and 'sp' for Spock."
  player_action = gets.chomp.downcase
  end until PLAY.keys.include?(player_action)

  computer_action = PLAY.keys.sample
  announce_hands(player_action, computer_action)
  compare_hands(player_action, computer_action)

  puts "Would you like to play again? Enter 'y' for yes, any other key to exit."
  break if gets.chomp.downcase != 'y'
end  