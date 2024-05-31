class Game 
    def initialize(code_breaker, code_maker)
        @code_breaker = code_breaker
        @code_maker = code_maker
        @status = "lose"
        @results = [0, 0] 
    end

    def play
        p @code_maker.set_code #delete later
        guess = @code_breaker.make_guess
        @results = @code_maker.check_code(guess)
        until @code_breaker.guesses == 0 || @results == [4, 0] 
            puts "\nTry again... you have #{@code_breaker.guesses} turn(s) left"
            guess = @code_breaker.make_guess
            @results = @code_maker.check_code(guess)
        end
    end

    def check_results
        if @results == [4, 0]
            @status = "win"
        end
        puts "\nYou #{@status}!"
    end
end