module Giraffe

    class IfTree

        def initialize(condition,instuctions,blockElse=nil)
            @condition = condition
            @instuctions = instuctions
            @blockElse = blockElse
        end

        def run(env)

            # IfTree preposila vsechny zpravy dal

            # z podminky muze prijit maximalne :exit
            returnValue, msg = @condition.run(env)
            return returnValue, msg if msg == :exit

            if returnValue
                for i in @instructions do 
                    returnValue, msg = i.run(newEnv)
                    return [returnValue, msg] if msg != nil 
                end
            elsif @blockElse != nil

                # TODO - tohle neni uplne dobre vyresene
                # chtelo by to nejaky objekt ktery to bude
                # oddelovat, takze stale bude stacit zavolat
                # jen blockElse.run(env)

                if @blockElse.instance_of?(IfTree)
                    
                    # pokud je to elseif, tak je v blockElse
                    # cely IfTree objekt, takze staci na nej
                    # zavolat standardni run(env) ...
                    returnValue, msg = @blockElse.run(env)
                    return [returnValue, msg] if msg != nil 

                else

                    # je to jen else ... pak je v blockElse 
                    # list prikazu
                    for i in @blockElse do 
                        returnValue, msg = i.run(newEnv)
                        return [returnValue, msg] if msg != nil 
                    end
                end

            end
        end

    end

end


