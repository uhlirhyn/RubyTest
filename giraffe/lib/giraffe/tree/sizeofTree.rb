# encoding: utf-8

require_relative '../debug.rb'
require_relative '../opcodes.rb'

module Giraffe

    # Generuje bytecode pro získání velikosti daného pole
    class SizeofTree
    
        include Debug
        include Opcodes
        
        # * <tt>expression</tt> AST adresy pole jehož velikost chci zjistit
        def initialize(expression)
            @expression = expression
        end
        
        # Provede traverzaci AST a vygeneruje bytecode
        # * <tt>env</tt> je předávané prostředí Env
        # * <tt>tree</tt> je soubor informací z parsersu (line, column)
        def run(env,tree)

            dbg("run",:SizeofTree)

            # Co chci merit ?
            return_value, msg = @expression[0].run(env,@expression[1])
            return return_value, msg if msg != nil

            # nech to spocitat
            env.write_opcode(SZOF)      

            return nil, nil
        end

    end

end


