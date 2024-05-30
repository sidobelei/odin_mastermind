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
end

p CodeMaker.new("human").set_code 