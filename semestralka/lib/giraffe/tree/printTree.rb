require './lib/giraffe/debug.rb'
require './lib/giraffe/opcodes.rb'

module Giraffe

    class PrintTree

        include Debug
        include Opcodes

        def initialize(texts,newline=false)
            @texts = texts
            @newline = newline
        end

        def run(env,tree)

            @tree = tree

            if @texts != nil 
                for text in @texts
                    return_value, msg = text[0].run(env,text[1])
                    case msg
                    when :error then return return_value + where, msg
                    when nil then ;
                    else return return_value, msg
                    end
                    env.write_bytecode(0x12)
                end
                puts if @newline
            end
            return nil, nil
        end
        
        def where
            "\n\tin print on line #{@tree.line}, column #{@tree.column}"
        end

    end

end


