class CodeMaker
    require_relative "validate"
    
    include Validate

    attr_accessor :type, :code

    def initialize(type)
        @type = type
        @code = []
    end

    def set_code
        valid_inputs = false
        until valid_inputs
            if type == "human"
                puts "Set your code"
                print "---<Seperate each number with a space>---  "
                self.code = gets.chomp.split(" ")
            elsif type == "computer"
                4.times do
                    self.code.push(rand(1..6).to_s) 
                end
            end
            valid_inputs = is_valid?(code)
        end
        return code
    end

    def check_code(guess_code)
        correct_position_value = 0 
        code.each_with_index do |element, index|
            if element == guess_code[index]
                correct_position_value += 1
            end 
        end
        correct_value = 4 - (guess_code - code).length
        correct_value -= correct_position_value
        puts "Numbers that are in the right position: #{correct_position_value}"
        puts "Numbers that are in the wrong position: #{correct_value}"
        return [correct_position_value, correct_value] 
    end
end