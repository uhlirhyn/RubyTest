# encoding: utf-8

require_relative '../debug.rb'
require_relative '../opcodes.rb'

module Giraffe

    # Páruje bytecode adresování cíle a bytecode hodnot
    #
    # Na levé straně může mít totiž:
    # * Locale -> pak na konci musi byt PSL
    # * Argument -> pak na konci musi byt PSA
    # * Indexace -> pak na konci musi byte ST
    class AssignTree
    
        include Debug
        include Opcodes
        
        # * <tt>expression</tt> je AST, který generuje bytecode pro výpočet pravé strany (hodnota)
        # * <tt>target</tt> je AST, který generuje bytecode - adresu - cíle
        def initialize(target,expression)
            @target = target
            @expression = expression
        end

        # Provede traverzaci AST a vygeneruje bytecode
        # * <tt>env</tt> je předávané prostředí Env
        # * <tt>tree</tt> je soubor informací z parsersu (line, column)
        def run(env,tree)
            
            dbg("run",:AssignTree)

            # 1.) Hodnota 
            return_value, msg = @expression[0].run(env,@expression[1])
            return return_value, msg if msg != nil
           
            # 2.) Adresa + 3.) Store
            return_value, msg = @target[0].run(env,@target[1],:store)
            return return_value, msg if msg != nil

            return nil, nil
        end

    end

end


