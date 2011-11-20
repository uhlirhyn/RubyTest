require './lib/giraffe/debug.rb'

module Giraffe

    class PrintTree

        include Debug

        def initialize(texts,newline=false)
            @texts = texts
            @newline = newline
        end

        def run(env,tree)

            @tree = tree

            # PrintTree
            # - nezpracovava zadnou zpravu
            # - negeneruje zadnou zpravu
            # - normalni vystup je hodnota promenne

            if @texts != nil 
                for text in @texts
                    return_value, msg = text[0].run(env,text[1])
                    case msg
                    when :error then return return_value + where, msg
                    when nil then ;
                    else return return_value, msg
                    end

                    print return_value
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


