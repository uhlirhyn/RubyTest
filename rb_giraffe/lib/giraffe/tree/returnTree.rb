require './lib/giraffe/debug.rb'

module Giraffe

    class ReturnTree

        include Debug

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

            dbg("returning '#{return_value}'",yellow(:ReturnTree))
            return return_value, :return
        end

    end

end


