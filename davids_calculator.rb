def say(str)
  puts "=> #{str}"
end

def get_user_input
  number = gets.chomp
  return number
end


say "What is the first number?"
number1 = get_user_input

say "what is the second number?"
number2 = get_user_input

say "Enter + to add, - to subtract, * to multiply, and / to divide."
action = gets.chomp

say "You entered #{action}."

if action == '+'
  puts "#{number1} + #{number2} = #{number1.to_i + number2.to_i}"
elsif action == '-'
  puts "#{number1} - #{number2} = #{number1.to_i - number2.to_i}"
elsif action == '*'
  puts "#{number1} * #{number2} = #{number1.to_i * number2.to_i}"
elsif action == '/'
  puts "#{number1} / #{number2} = #{number1.to_f / number2.to_f}"
else
  puts "That is not a valid action!"
end
