require './lib/giraffe/env.rb'
require './lib/giraffe/debug.rb'

module Giraffe

    class ForTree

        include Debug

        def initialize(assignment1,condition,assignment2,instructions)
            dbg("run",:ForTree)
            @assignment1 = assignment1           
            @condition = condition
            @assignment2 = assignment2            
            @instructions = instructions            
        end

        def run(env,tree)

            @tree = tree

            # TODO viz Env.gdoc

            #newEnv = Env.new(env)
            #return_value, msg = innerRun(newEnv)
            #newEnv.destroy
            return_value, msg = innerRun(env)
            return return_value, msg
        end

        private 
        
        def where
            "\n\tin for cycle on line #{@tree.line}, column #{@tree.column}"
        end

        def innerRun(env)

            dbg("run",:ForTree)

            # deklarace
            return_value = msg = nil

            # assignment muze preposlat maximalne :exit
            return_value, msg = @assignment1.run(env,@tree)
            case msg  
            when nil;
            when :error then return return_value + where, msg
            else return return_value, msg
            end
            dbg("assignment1 OK",:ForTree)

            # podminka 
            return_value, msg = @condition[0].run(env,@condition[1])
            case msg  
            when nil;
            when :error then return return_value + where, msg
            else return return_value, msg
            end
            dbg("condition OK",:ForTree)

            while return_value do
                for i in @instructions do 
                    return_value, msg = i[0].run(env,i[1])
                    case msg  
                    when :break then return nil, nil
                    when nil;
                    when :error then return return_value + where, msg
                    else return return_value, msg
                    end
                end
                dbg("instructions OK",:ForTree)

                # assignment 
                return_value, msg = @assignment2.run(env,@tree)
                case msg  
                when nil;
                when :error then return return_value + where, msg
                else return return_value, msg
                end
                dbg("assignment2 OK",:ForTree)

                # pro vyhodnoceni while 
                return_value, msg = @condition[0].run(env,@condition[1])
                case msg  
                when nil;
                when :error then return return_value + where, msg
                else return return_value, msg
                end
                dbg("condition '#{return_value}' '#{msg}'",:ForTree)

            end

            # ForTree normalne nevraci ani hodnotu ani zpravu
            return nil, nil
        end

    end

end


