class CodeBreaker
    def initialize(type)
        @type = type
        @guesses = 12
    end
    
    def make_guess
        valid_inputs = false
        until valid_inputs == true
            print "---<Seperate each number with a space>---  "
            maker_guess = gets.chomp.split(" ")
            if maker_guess.length == 4
                maker_guess.each do |element|
                    if !["1", "2", "3", "4", "5", "6"].include?(element)
                        valid_inputs = false
                        puts "\nInvalid guess, try again."
                        break
                    else
                        valid_inputs = true
                    end
                end
            else 
                puts "\nInvalid guess, try again."
            end
        end
        return maker_guess
    end
end

 code_breaker = CodeBreaker.new("person")
 p code_breaker.make_guess