require './lib/giraffe/debug.rb'

module Giraffe

    class UnaryOperatorTree

        include Debug

        def initialize(op,operator)
            @op = op
            @operator = operator
        end

        def where
            "\n\tin operator '#{@operator}' on line #{@tree.line}, column #{@tree.column}"
        end

        def run(env,tree)
        
            @tree = tree

            return_value, msg = @op[0].run(env,@op[1])
            return return_value, msg if msg != nil
            
            # kontrola typu operandu 
            # - musi byt cislo 
            if return_value != :number
                puts red("Error: ") + 
                    orange("Can't operate with #{return_value}") + 
                    where 
                return nil,:error
            end

            return_value, msg = @operator.call(return_value)
            return return_value, msg if msg != nil

            # operandy by mely byt ted uz pushnute na stacku
            env.write_opcode(return_value)

            # unarni operator zatim
            # vraci pouze cislo - na
            # nic jineho operatory nemam
            return :number, nil
        end
        
    end

end


