class Game 
    def initialize(code_breaker, code_maker)
        @code_breaker = code_breaker
        @code_maker = code_maker
        @status = "lose"
        @results = [0, 0] 
    end

    def play
        @code_maker.set_code
        puts "\n"
        guess = @code_breaker.make_guess
        @results = @code_maker.check_code(guess)
        until @code_breaker.guesses == 0 || @results == [4, 0] 
            puts "\nTry again... you have #{@code_breaker.guesses} turn(s) left"
            guess = @code_breaker.make_guess(@results)
            @results = @code_maker.check_code(guess)
        end
    end

    def check_results
        if @results == [4, 0]
            @status = "win"
        end
        if @code_breaker.type == "human"
            puts "\nYou #{@status}!"
        else
            if @status == "win"
                puts "\nThe Computer cracked the code, you lose!"
            else
                puts "\nThe Computer couldn't crack the code, you win!"
            end
        end
        puts "The Secret Code was: #{@code_maker.maker_code}"
    end
end