# encoding: utf-8

require_relative '../debug.rb'
require_relative '../opcodes.rb'

module Giraffe

    # Generuje bytecode otevření souboru dle názvu
    class OpenFileTree

        include Debug
        include Opcodes
       
        # * <tt>expression</tt> AST názvu souboru
        # * <tt>mode</tt> AST módu otevření souboru
        def initialize(expression, mode)
            @expression = expression
            @mode = mode
        end

        # Provede traverzaci AST a vygeneruje bytecode
        # * <tt>env</tt> je předávané prostředí Env
        # * <tt>tree</tt> je soubor informací z parsersu (line, column)
        def run(env, tree)

            dbg("run",:OpenFileTree)
            dbg("expression '#{@expression}'",:OpenFileTree)

            # nech vyhodnotit ten obsah
            return_value, msg = @expression[0].run(env,@expression[1])
            return return_value, msg if msg != nil
            
            # nech vyhodnotit ten mod
            return_value, msg = @mode[0].run(env,@mode[1])
            return return_value, msg if msg != nil

            env.write_opcode(FO)

            return nil, nil
        end

    end

end


