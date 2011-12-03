require './lib/giraffe/debug.rb'
require './lib/giraffe/opcodes.rb'

module Giraffe

    class ArrayTree
    
        include Debug
        include Opcodes
        
        def initialize(elements)
            @elements = elements
            dbg("init",:ArrayTree)
        end

        # ArrayTree
        #
        # Provadi alokace novych poli
        #
        def run(env,tree)

            dbg("run",:ArrayTree)

            # alokuj v pameti tolik kolik je 
            # velikost toho pole
            env.write_opcode(ALOC)      
            env.write_int(@elements.size < Env::MIN_ALLOC ? 
                          Env::MIN_ALLOC : @elements.size)    

            # na stacku je ted "adresa" 
            # na to alokovane pole
            # takze ted muzu brat postupne 
            # ty prvky a rovnou je tam nahrat

            # vypocitej hodnoty elementu
            index = 0
            for element in @elements do

                # 1.) Adresa v pameti (base)

                # musim si zkopirovat tu adresu,
                # protoze jednak chci aby po naplneni
                # pole ta adresa zustala na zasobniku
                # pro ulozeni do promenne apod. a 
                # jednak ji potrebuje ta ukladana 
                # hodnota za mnou (dalsi prvek)
                # (instrukce IST tu adresu popne)
                env.write_opcode(DUP)     
                
                # 2.) Index pole (offset)

                # slo by to psat rovnou do BC,
                # ale to jen v tomto priprade,
                # obecne kdyz se pak pouziva
                # instukce IST na ukladani dle
                # indexu, ktery se pocita, bere
                # se to ze stacku - musel bych 
                # tak mi jeste jednu instrukci ...
                env.write_opcode(PUSH)      # instrukce push
                env.write_int(index)        # index 

                # 3.) Data pro store

                # obsah prvku
                return_value, msg = element[0].run(env,element[1])
                return return_value, msg if msg != nil
                
                # instrukce store
                env.write_opcode(ST)       
                
                # inkrementuj citac
                index += 1

            end


            # Tady se MUSI vracen nil,
            # jinak se pole v @value rozbali do 
            # msg v rodicovskem uzlu a zpusobi xx
            return nil, nil
        end

    end

end


