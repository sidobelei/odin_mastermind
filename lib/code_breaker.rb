class CodeBreaker
    require_relative "validate"
    
    include Validate

    attr_accessor :guesses

    def initialize(type)
        @type = type
        @guesses = 12
    end
    
    def make_guess
        valid_inputs = false
        until valid_inputs == true
            print "---<Seperate each number with a space>---  "
            maker_guess = gets.chomp.split(" ")
            valid_inputs = is_valid?(maker_guess) 
        end
        self.guesses -= 1
        return maker_guess
    end
end