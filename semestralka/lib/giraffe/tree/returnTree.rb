require './lib/giraffe/debug.rb'
require './lib/giraffe/opcodes.rb'

module Giraffe

    class ReturnTree

        include Debug
        include Opcodes

        def initialize(expression)
            @expression = expression
        end

        def where
            "\n\tin return on line #{@tree.line}, column #{@tree.column}"
        end

        def run(env,tree)

            @tree = tree

            dbg("run",:ReturnTree)
            return_value, msg = @expression[0].run(env,@expression[1])
            case msg
            when :exit then return return_value, msg
            when :error then return return_value + where, msg
            when nil;
            else return return_value, msg
            end

            env.write_opcode(0x0a)

            dbg("returning '#{return_value}'",yellow(:ReturnTree))
            return return_value, nil
        end

    end

end


