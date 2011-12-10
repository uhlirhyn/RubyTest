require './lib/giraffe/debug.rb'
require './lib/giraffe/opcodes.rb'

module Giraffe

    class ArrayTree
    
        include Debug
        include Opcodes
        
        def initialize(elements)
            @elements = elements
        end

        # ArrayTree
        #
        # Provadi alokace novych poli
        #
        def run(env,tree)

            dbg("run",:ArrayTree)
          
            # pokud jeste neco chybi, pak
            # dosazej nulove prvky
            for i in 1..(Env::MIN_ALLOC - @elements.size) do
                env.write_opcode(PUSH)
                env.write_int(0xFFFFFFFF)
            end
  
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
            env.write_opcode(ALOC)      
            env.write_4B(@elements.size < Env::MIN_ALLOC ? 
                          Env::MIN_ALLOC : @elements.size)    

            # ALOC udela to, ze sebere ty hodnoty ze stacku
            # a rovnou je nasazi do toho pole 

            # vysledkem je pole - resp. ukazatel
            return :array, nil
        end

    end

end


