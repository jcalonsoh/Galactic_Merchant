
# frozen_string_literal: true
def greeting(say)
  printf("Bienvenido #{say}\n")
end

puts 'Hi! Welcome galactic merchent.'
puts 'We have the next minerals: Silver, Gold and Iron'
puts 'And the available units glob, prok, pish and tegj'
puts "For exit hit 'q' and enter\n\n"

begin
  @quote = gets.strip
  greeting(@quote)
  puts "\nYou will like to quote something else?\n\n"
end until @quote.casecmp('q').zero?
