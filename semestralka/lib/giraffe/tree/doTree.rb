module Giraffe

    class DoTree

        def initialize(condition,instructions)
            @condition = condition
            @instructions = instructions
        end

        def run(env)

            # DoTree
            # - @instructions zpracovava :break
            # - @condition nezpracovava zadnou zpravu
            # - neprodukuje zadnou zpravu
            # - normalni vystup je nil

            begin 
                for i in @instructions do 
                    return_value, msg = i.run(env)
                    case msg  
                    when :break then return nil, nil
                    when nil;
                    when :error then return return_value + "\n\tin do", msg
                    else return return_value, msg
                    end
                end

                # while podminka
                return_value, msg = @condition.run(env)
                case msg  
                when nil;
                when :error then return return_value + "\n\tin do", msg
                else return return_value, msg
                end

            end while return_value

            return nil, nil
        end

    end

end


