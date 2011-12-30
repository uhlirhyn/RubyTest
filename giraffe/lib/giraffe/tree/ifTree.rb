require './lib/giraffe/debug.rb'
require './lib/giraffe/opcodes.rb'

module Giraffe

    class IfTree

        include Debug
        include Opcodes

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
            return return_value, msg if msg != nil

            # vloz instrukci skoku pokud nebude rovno
            env.write_opcode(JNEQ)

            # obstarej si navesti (hak)
            # a vloz ho do sablony bytecodu
            false_label = env.next_label
            env.insert_hook(false_label)

            # jsem v if casti
            env.return_branch_if

            dbg("IF - false_label #{false_label}",:IfTree)
            for i in @instructions do 
                return_value, msg = i[0].run(env,i[1])
                return return_value, msg if msg == :error
            end

            # az se provede IF je potreba preskocit ELSE
            env.write_opcode(JMP)

            # obstarej si navesti (hak)
            # a vloz ho do sablony bytecodu
            true_label = env.next_label
            env.insert_hook(true_label)
            
            # vloz kotvu navesti
            env.insert_anchor(false_label)
            dbg("IF - false_label anchor placed",:IfTree)

            if @blockElse != nil

                # jsem v else casti
                env.return_branch_else

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
                    return return_value, msg if msg == :error

                else

                    dbg("ELSE",:IfTree)

                    # je to jen else ... pak je v blockElse 
                    # list prikazu
                    for i in @blockElse do 
                        return_value, msg = i[0].run(env,i[1])
                        return return_value, msg if msg == :error
                    end
                end

            end

            # vynoril jsem se
            env.return_rise

            # vloz kotvu navesti
            env.insert_anchor(true_label)

            # nic nevracim, zpravy jsou take ok
            dbg("DONE",:IfTree)
            return nil, nil
        end

    end

end


