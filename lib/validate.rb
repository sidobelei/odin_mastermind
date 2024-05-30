module Validate
    def is_valid?(code)
        valid_inputs = true
        if code.length == 4
            code.each do|element|
                if !["1", "2", "3", "4", "5", "6"].include?(element)
                    valid_inputs = false
                    break
                end
            end
        else
            valid_inputs = false
        end
        if !valid_inputs
            puts "\nInvalid code, try again.\n\n" 
        end
        return valid_inputs
    end
end