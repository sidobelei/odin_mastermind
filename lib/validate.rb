module Validate
    COLORS = ["r", "o", "y", "g", "b", "p"]
    
    def is_valid?(code)
        valid_inputs = true
        if code.length == 4
            code.each do|element|
                if !COLORS.include?(element)
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