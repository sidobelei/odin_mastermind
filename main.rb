require_relative "lib/code_breaker"
require_relative "lib/code_maker"
require_relative "lib/game"

answer = nil
breaker_selected = nil
maker_selected = nil

puts "Welcome to Mastermind"
puts "How to play:"
puts "- Each code is made up 4 letters from the following inputs r, o, y, b, g, p. They" 
puts "  represent the colors red, orange, yellow, blue, green and purple"
puts "- The code can contain repeats of any color"
puts "- As a codebreaker your job is to crack the code"
puts "- As the codemaker you create the code for the computer to crack"
print "\nWould you like to be the codebreaker or codemaker? "
until ["codebreaker", "codemaker", "breaker", "maker"].include?(answer)
    answer = gets.chomp.downcase.gsub(/\s+/, "")
    if answer == "codebreaker" || answer == "breaker"
        breaker_selected = "human"
        maker_selected = "computer"
    elsif answer == "codemaker" || answer == "maker"        
        breaker_selected = "computer"
        maker_selected = "human"
    else
        puts "\nInvalid Response"
        print "Would you like to be the codebreaker or codemaker? "
    end
end

code_breaker = CodeBreaker.new(breaker_selected)
code_maker = CodeMaker.new(maker_selected)
game = Game.new(code_breaker, code_maker)

game.play
game.check_results