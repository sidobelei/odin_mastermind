class CodeBreaker
    require_relative "validate"
    
    include Validate

    attr_accessor :type, :guesses, :guess_history, :correct_colors_array, :correct_colors_permutations

    def initialize(type)
        @type = type
        @guesses = 12
        @guess_history = []
        @correct_colors_array = []
        @correct_colors_permutations = []
    end
    
    def make_guess(feedback = [0, 0])
        maker_guess = []
        if @type == "human"
            valid_inputs = false
            until valid_inputs == true
                print "---<Seperate each letter with a space.>--->  "
                maker_guess = gets.chomp.split(" ")
                maker_guess.map! {|element| element.downcase}
                valid_inputs = is_valid?(maker_guess) 
            end
        else 
            maker_guess = computer_guesser(feedback)
        end
        self.guesses -= 1
        return maker_guess
    end

    def computer_guesser(feedback)
        computer_guess = []
        attempt = 12 - guesses
        total_correct_colors = feedback.sum
        if correct_colors_array.empty?
            if attempt == 0
                4.times do computer_guess.push(COLORS[attempt])
                end
            elsif total_correct_colors != 4 
                guess_history[attempt - 1].each_with_index do |color, position|
                    if position < total_correct_colors
                        computer_guess.push(guess_history[attempt - 1][position])
                    else
                        computer_guess.push(COLORS[attempt])
                    end
                end
            else
                self.correct_colors_array = guess_history[attempt - 1]
                computer_guess = guess_history[attempt - 1]
            end
        end
        if !correct_colors_array.empty?
            computer_guess = give_permutation_choice(guess_history[attempt - 1])
        end
        self.guess_history.push(computer_guess)
        print "---<Seperate each letter with a space>---> "
        computer_guess.each {|color| print "#{color} "}
        puts "\n"
        return computer_guess
    end
    
    def give_permutation_choice(array)
        if correct_colors_permutations.empty?
            self.correct_colors_permutations = array.permutation(4).to_a.uniq
            self.correct_colors_permutations.delete(array)
        end
        random_index = rand(0..(correct_colors_permutations.length - 1))
        permutation_choice = correct_colors_permutations[random_index]
        self.correct_colors_permutations.delete(permutation_choice)
        return permutation_choice
    end
end