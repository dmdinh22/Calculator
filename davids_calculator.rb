def say(str)
  puts "=> #{str}"
end

def validate_input(number)
  (number.to_i.to_s == number) || (number.to_f.to_s == number)
end

def get_user_input
  begin
    number = gets.chomp
    puts "That is an invalid number, please enter a different number." unless validate_input(number)
  end until validate_input(number)
  return number
end


say "What is the first number?"
number1 = get_user_input

say "what is the second number?"
number2 = get_user_input

say "Enter + to add, - to subtract, * to multiply, and / to divide. Enter any other key to exit."
action = gets.chomp

say "You entered #{action}."


case action
when '+'
  puts "#{number1} + #{number2} = #{number1.to_i + number2.to_i}"
when'-'
  puts "#{number1} - #{number2} = #{number1.to_i - number2.to_i}"
when '*'
  puts "#{number1} * #{number2} = #{number1.to_i * number2.to_i}"
when '/'
  puts "#{number1} / #{number2} = #{number1.to_f / number2.to_f}"
else
  puts "That is not a valid action!"
end

puts "Thank you for using David's calculator."
