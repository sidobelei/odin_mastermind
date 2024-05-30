class CodeMaker
    attr_accessor :type, :code
    def initialize(type)
        @type = type
        @code = []
    end

    def set_code
        if type == "human"
            puts "Set your code"
            print "---<Seperate each number with a space>---  "
            self.code = gets.chomp.split(" ")
        elsif type == "computer"
            4.times do
                self.code.push(rand(1..6)) 
            end
        end
        return code
    end
end

p CodeMaker.new("computer").set_code 