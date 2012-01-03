# encoding: utf-8

require_relative '../debug.rb'
require_relative '../opcodes.rb'

module Giraffe

    # Generuje bytecode pro načtení čísla ze souboru
    class ReadNumberTree

        include Debug
        include Opcodes
       
        # * <tt>expression</tt> AST file descriptoru souboru
        def initialize(expression)
            @expression = expression
        end

        # Provede traverzaci AST a vygeneruje bytecode
        # * <tt>env</tt> je předávané prostředí Env
        # * <tt>tree</tt> je soubor informací z parsersu (line, column)
        def run(env, tree)

            dbg("run",:ReadNumberTree)

            # nech vyhodnotit ten obsah
            return_value, msg = @expression[0].run(env,@expression[1])
            return return_value, msg if msg != nil
            
            env.write_opcode(RN)

            return nil, nil
        end

    end

end


