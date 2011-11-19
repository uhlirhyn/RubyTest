require './lib/giraffe/debug.rb'

module Giraffe

    class PrintTree

        include Debug

        def initialize(texts,newline=false)
            @texts = texts
            @newline = newline
        end

        def run(env)

            # PrintTree
            # - nezpracovava zadnou zpravu
            # - negeneruje zadnou zpravu
            # - normalni vystup je hodnota promenne

            if @texts != nil 
                for text in @texts
                    return_value, msg = text.run(env)
                    case msg
                    when :error then return return_value + "\n\tin print", msg
                    when nil then ;
                    else return return_value, msg
                    end

                    print return_value
                end
                puts if @newline
            end
            return nil, nil
        end

    end

end


