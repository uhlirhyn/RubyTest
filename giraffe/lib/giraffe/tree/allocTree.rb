# encoding: utf-8

require_relative '../debug.rb'
require_relative '../opcodes.rb'

module Giraffe

    # Alokace pole o určené velikost
    class AllocTree
    
        include Debug
        include Opcodes
    
        # * <tt>expression</tt> je AST, který generuje bytecode pro výpočet velikosti
        def initialize(expression)
            @expression = expression
        end
        
        # Provede traverzaci AST a vygeneruje bytecode
        # * <tt>env</tt> je předávané prostředí Env
        # * <tt>tree</tt> je soubor informací z parsersu (line, column)
        def run(env,tree)

            dbg("run",:AllocTree)

            # kolik prvku chci ?
            return_value, msg = @expression[0].run(env,@expression[1])
            return return_value, msg if msg != nil

            # alokuj v pameti tolik kolik je 
            # velikost toho pole
            env.write_opcode(CALLOC)      

            # CALLOC udela to, naalokuje
            # pozadovanou velikost pole
            # a vynuluje ji

            # vysledkem je pole - resp. ukazatel
            return nil, nil
        end

    end

end


