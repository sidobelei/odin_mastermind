require_relative "lib/code_breaker"
require_relative "lib/code_maker"
require_relative "lib/game"

answer = nil
breaker_selected = nil
maker_selected = nil

puts "Welcome to Mastermind"
print "Would you like to be the codebreaker or codemaker? "
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