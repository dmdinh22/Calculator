# ruby example.rb <file name>

nouns = File.open('nouns.txt', 'r') do |f|
  f.read
end.split

# opening files in do/end block, it will automatically close it

verbs = File.open('verbs.txt', 'r') do |f|
  f.read
end.split

adjectives = File.open('adjectives.txt', 'r') do |f|
  f.read
end.split


dictionary = {
  nouns: nouns,
  verbs: verbs,
  adjectives: adjectives
}

def say(message)
  puts "=> #{message}"
end

def exit_with(message)
  say message
  exit
end

def get_input(word)
  puts "Input a #{word}:"
  STDIN.gets.chomp
end


exit_with("No input file!") if ARGV.empty?
exit_with("Input file does not exist.") if !File.exists?(ARGV[0])

contents = File.open(ARGV[0], 'r') do |f|
  f.read
end

# contents.gsub!('NOUN', dictionary[:nouns].sample)

contents.gsub!('NOUN').each do |noun|
  get_input(noun)
end

contents.gsub!('VERB').each do 
  dictionary[:verbs].sample
end

contents.gsub!('ADJECTIVE').each do
  dictionary[:adjectives].sample
end

p contents