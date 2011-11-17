require './lib/giraffe/debug.rb'

module Giraffe

    class IfTree

        include Debug
        
        def initialize(condition,instructions,blockElse=nil)
            @condition = condition
            @instructions = instructions
            @blockElse = blockElse
        end

        def run(env)
            
            dbg("run",:IfTree)

            # IfTree preposila vsechny zpravy dal

            # z podminky muze prijit maximalne :exit
            returnValue, msg = @condition.run(env)
            return returnValue, msg if msg == :exit

            if returnValue
                dbg("IF",:IfTree)
                for i in @instructions do 
                    returnValue, msg = i.run(env)
                    return [returnValue, msg] if msg != nil 
                end
            elsif @blockElse != nil

                # TODO - tohle neni uplne dobre vyresene
                # chtelo by to nejaky objekt ktery to bude
                # oddelovat, takze stale bude stacit zavolat
                # jen blockElse.run(env)

                if @blockElse.instance_of?(IfTree)
                    
                    dbg("ELSE-IF",:IfTree)
                    
                    # pokud je to elseif, tak je v blockElse
                    # cely IfTree objekt, takze staci na nej
                    # zavolat standardni run(env) ...
                    returnValue, msg = @blockElse.run(env)
                    return [returnValue, msg] if msg != nil 

                else
    
                    dbg("ELSE",:IfTree)

                    # je to jen else ... pak je v blockElse 
                    # list prikazu
                    for i in @blockElse do 
                        returnValue, msg = i.run(env)
                        return [returnValue, msg] if msg != nil 
                    end
                end

            end

            # nic nevracim, zpravy jsou take ok
            dbg("DONE",:IfTree)
            return nil, nil
        end

    end

end


