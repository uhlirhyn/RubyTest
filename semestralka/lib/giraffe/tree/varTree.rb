require './lib/giraffe/debug.rb'

module Giraffe

    class VarTree

        include Debug

        def initialize(id)
            @id = id

            # jakou instrukci budu zapisovat data
            # resp. nahravat
            @inst = nil
        end

        # VarTree
        #
        # Spravuje veci kolem lokalnich
        # promennych a argumentu - jeho
        # ucel je vkladat na stack id
        # lokalni promenne nebo argumentu
        # 
        # Druha vec kterou pak dela, je 
        # ze vklada do bytecodu odpovidajici
        # instrukce pro vkladani nebo tahani
        # dat z/do identifikovanych promennych
        # nebo argumentu
        #
        def run(env,tree,direction=:load)
          
            dbg("run",:VarTree)

            # bude se tato promenna cist ? (prava strana)
            if direction == :load

                # Ziskej z ENV svoje ID a vloz 
                # ho do bytecodu jako PUSH

                # evn.var promennou zkusi najit,
                # pokud ji najde, tak zapise
                # jeji ID do bytecodu a rovou
                # tam vyhodi i instrukci pro cteni,
                # protoze kdyz se z promenne cte, 
                # jsou potreba data na stacku okamzite, 
                # neceka se az budou dodana data 
                # a pak se provede jejich zapis
                return_value, msg = env.var(@id)
                return return_value, msg if msg != nil 

            else 

                # proved zapis do promenne @id
                return_value, msg = env.var!(@id)
                return return_value, msg if msg != nil 

            end

        end
 
        def store(env)
            # tohle uz je hotove
            # instrukce se zavolali 
            # jiz v ENV
        end
        
    end

end


