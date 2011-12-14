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
       
            dbg("run", :PrintTree)

            @tree = tree

            if @texts != nil 
                for text in @texts
                    return_value, msg = text[0].run(env,text[1])
                    return return_value, msg if msg == :error
                   
                    env.write_opcode(OUT)
                end
            end

            # nemam typ
            return nil, nil
        end
        
        def where
            "\n\tin print on line #{@tree.line}, column #{@tree.column}"
        end

    end

end


