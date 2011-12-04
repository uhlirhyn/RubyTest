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
                    return return_value, msg if msg == :error
                    
                    # print umi tisk pouze hodnot ne pole 
                    if return_value != :number
                        puts red("Error: ") + 
                            orange("Can't print #{return_value}") + 
                            where
                        return return_value, :error
                    end

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


