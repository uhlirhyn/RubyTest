require './lib/giraffe/debug.rb'

module Giraffe

    class IfTree

        include Debug

        def initialize(condition,instructions,blockElse=nil)
            @condition = condition
            @instructions = instructions
            @blockElse = blockElse
        end

        def where
            "\n\tin if on line #{@tree.line}, column #{@tree.column}"
        end

        def run(env,tree)

            @tree = tree

            dbg("run",:IfTree)

            # IfTree preposila vsechny zpravy dal

            # z podminky muze prijit maximalne :exit
            return_value, msg = @condition[0].run(env,@condition[1])
            case msg
            when :exit then return return_value, msg
            when :error then return return_value + where, msg
            when nil;
            else return return_value, msg
            end

            if return_value
                dbg("IF",:IfTree)
                for i in @instructions do 
                    return_value, msg = i[0].run(env,i[1])
                    case msg
                    when :exit then return return_value, msg
                    when :error then return return_value + where, msg
                    when nil;
                    else return return_value, msg
                    end
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
                    return_value, msg = @blockElse.run(env)
                    case msg
                    when :exit then return return_value, msg
                    when :error then return return_value + where, msg
                    when nil;
                    else return return_value, msg
                    end

                else

                    dbg("ELSE",:IfTree)

                    # je to jen else ... pak je v blockElse 
                    # list prikazu
                    for i in @blockElse do 
                        return_value, msg = i[0].run(env,i[1])
                        case msg
                        when :exit then return return_value, msg
                        when :error then return return_value + where, msg
                        when nil;
                        else return return_value, msg
                        end
                    end
                end

            end

            # nic nevracim, zpravy jsou take ok
            dbg("DONE",:IfTree)
            return nil, nil
        end

    end

end


