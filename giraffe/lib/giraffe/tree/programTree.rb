require './lib/giraffe/env.rb'
require './lib/giraffe/debug.rb'

module Giraffe

    class ProgramTree

        include Debug

        def initialize(functions)
            dbg("ProgramTree initialized",:ProgramTree)
            @functions = functions
            @env = Env.new 
        end

        def run
            dbg("run",:ProgramTree)

            # deklarace
            return_value = msg = nil

            for i in @functions do 
                return_value, msg = i[0].run(@env,i[1]) 
                case msg 
                when :break 
                    puts red("Error: ") + "Unexpected break"
                    return nil, :error
                when :error 
                    puts return_value
                    return nil, :error
                end
            end

            dbg("out of instructions - success",:ProgramTree)
            return @env.codegen, nil
        end

    end

end


