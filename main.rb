require_relative "lib/code_breaker"
require_relative "lib/code_maker"
require_relative "lib/game"

code_breaker = CodeBreaker.new("human")
code_maker = CodeMaker.new("computer")
game = Game.new(code_breaker, code_maker)

puts "Welcome to Mastermind"
game.play
game.check_results