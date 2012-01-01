require_relative '../env.rb'
require_relative '../debug.rb'

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
                return return_value, msg if msg == :error
            end

            dbg("out of instructions - success",:ProgramTree)
            return @env.codegen, nil
        end

    end

end


