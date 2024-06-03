class CodeMaker
    require_relative "validate"
    
    include Validate

    attr_accessor :type, :maker_code

    def initialize(type)
        @type = type
        @maker_code = []
    end

    def set_code
        valid_inputs = false
        until valid_inputs
            if type == "human"
                puts "Set your code. Valid inputs: r, o, y, g, b, p"
                print "---<Seperate each letter with a space>--->  "
                self.maker_code = gets.chomp.split(" ")
            elsif type == "computer"
                4.times do
                    color = rand(0..5)
                    self.maker_code.push(COLORS[color]) 
                end
            end
            valid_inputs = is_valid?(maker_code)
        end
        return maker_code
    end

    def check_code(breaker_guess)
        correct_position_value = 0
        correct_value = 0
        maker_code_positions = map_values_to_positions(maker_code)
        breaker_code_positions = map_values_to_positions(breaker_guess)
        maker_code_positions.each do |color, positions|
            if breaker_code_positions.has_key?(color)
                number_of_matches = 0
                color_difference = 0
                maker_total_color = maker_code_positions[color].length
                breaker_total_color = breaker_code_positions[color].length

                positions.each do |location|
                    if breaker_code_positions[color].include?(location)
                        number_of_matches += 1
                    end
                end

                if maker_total_color > breaker_total_color
                    color_difference = maker_total_color - breaker_total_color
                elsif maker_total_color <= breaker_total_color 
                    color_difference = maker_total_color
                end
                correct_value += color_difference - number_of_matches
                correct_position_value += number_of_matches
            end
        end
        puts "Colors that are in the right position: #{correct_position_value}"
        puts "Colors that are in the wrong position: #{correct_value}"
        return [correct_position_value, correct_value] 
    end

    def map_values_to_positions(code)
        code_positions = {}
        code.each_with_index do |element, index|
            if code_positions.has_key?(element.to_sym)
                code_positions[element.to_sym].push(index)
            else
                code_positions[element.to_sym] = [index]
            end
        end
        return code_positions
    end
end