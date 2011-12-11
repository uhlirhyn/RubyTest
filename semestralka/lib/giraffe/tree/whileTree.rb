require './lib/giraffe/debug.rb'

module Giraffe

    class WhileTree

        include Debug

        def initialize(condition,instructions)
            @condition = condition
            @instructions = instructions
        end

        def run(env)

            dbg("run",:WhileTree)
            dbg("@instructions.size #{@instructions == nil ? nil : @instructions.size}",:WhileTree)
           
            # while podminka pri prvnim spusteni
            return_value, msg = @condition.run(env)
            return return_value, msg if msg != nil

            # vloz instrukci skoku pokud nebude rovno
            env.write_opcode(JNEQ)

            # obstarej si navesti (hak)
            # a vloz ho do sablony bytecodu
            false_label = env.next_label
            env.insert_hook(false_label)

            # vnoruju se
            env.return_dive

            # jsem v cykl casti
            env.return_branch_cycle

            for i in @instructions do 
                return_value, msg = i.run(env)
                return return_value, msg if msg != nil
            end

            # vynoril jsem se
            env.return_rise

            # vloz kotvu navesti
            env.insert_anchor(false_label)

            return nil, nil
        end

    end

end


