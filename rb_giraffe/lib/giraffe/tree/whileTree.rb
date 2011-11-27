require './lib/giraffe/debug.rb'

module Giraffe

    class WhileTree

        include Debug

        def initialize(condition,instructions)
            @condition = condition
            @instructions = instructions
        end

        def run(env)

            # WhileTree 
            # - @condition nezpracovava zadnou zpravu
            # - @instructions zpracovava :break
            # - neprodukuje zadnou zpravu
            # - normalni vystup je nil

            dbg("run",:WhileTree)
            dbg("@instructions.size #{@instructions == nil ? nil : @instructions.size}",:WhileTree)

            # while podminka pri prvnim spusteni
            return_value, msg = @condition.run(env)
            case msg  
            when nil;
            when :error then return return_value + "\n\tin while", msg
            else return return_value, msg
            end

            while return_value do
                for i in @instructions do 
                    return_value, msg = i.run(env)
                    case msg  
                    when :break then return nil, nil
                    when nil;
                    when :error then return return_value + "\n\tin while", msg
                    else return return_value, msg
                    end
                end

                # while podminka pri testovani z cyklu
                return_value, msg = @condition.run(env)
                case msg  
                when nil;
                when :error then return return_value + "\n\tin while", msg
                else return return_value, msg
                end

            end

            return nil, nil
        end

    end

end


