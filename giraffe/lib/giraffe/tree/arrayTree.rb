# encoding: utf-8

require_relative '../debug.rb'
require_relative '../opcodes.rb'

module Giraffe

    # Alokace pole pro dané prvky
    class ArrayTree
    
        include Debug
        include Opcodes
        
        # * <tt>elements</tt> je pole AST, které generují bytecode elementů alokovaného pole
        def initialize(elements)
            @elements = elements
        end
        
        # Provede traverzaci AST a vygeneruje bytecode
        # * <tt>env</tt> je předávané prostředí Env
        # * <tt>tree</tt> je soubor informací z parsersu (line, column)
        def run(env,tree)

            dbg("run",:ArrayTree)
          
            # vypocitej hodnoty elementu
            # a vloz je na stack - je to pozpatku
            # aby se dalo ze stacku vybirat v poradi
            for element in @elements.reverse do
                
                # obsah prvku
                return_value, msg = element[0].run(env,element[1])
                return return_value, msg if msg != nil
                
            end

            # alokuj v pameti tolik kolik je 
            # velikost toho pole
            env.write_opcode(ALLOC)      
            env.write_4B(@elements.size)    

            # ALLOC udela to, ze sebere ty hodnoty ze stacku
            # a rovnou je nasazi do toho pole 

            # vysledkem je pole - resp. ukazatel
            return nil, nil
        end

    end

end


