def say(str)
  puts "=> #{str}"
end

say "What is the first number?"
number1 = gets.chomp

say "what is the second number?"
number2 = gets.chomp

say "Enter 1 to add, 2 to subtract, 3 to multiply, and 4 to divide."
action = gets.chomp

say "You entered choice #{action}"

if action == '1'
  puts number1.to_i + number2.to_i
elsif action == '2'
  puts number1.to_i - number2.to_i
elsif action == '3'
  puts number1.to_i * number2.to_i
else
  puts number1.to_f / number2.to_f
end

