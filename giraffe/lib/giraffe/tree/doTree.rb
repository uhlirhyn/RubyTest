require './lib/giraffe/debug.rb'
require './lib/giraffe/opcodes.rb'

module Giraffe

    class DoTree

        include Debug
        include Opcodes

        def initialize(condition,instructions)
            @condition = condition
            @instructions = instructions
        end

        def run(env,tree)

            dbg("run",:DoTree)
            dbg("@instructions.size #{@instructions == nil ? nil : @instructions.size}",:DoTree)
           
            # obstarej si navesti (hak)
            # a vloz ho do sablony bytecodu
            true_label = env.next_label
            
            # vloz kotvu navesti
            env.insert_anchor(true_label)

            # vnoruju se
            env.return_dive

            # jsem v cykl casti
            env.return_branch_cycle

            for i in @instructions do 
                return_value, msg = i[0].run(env, i[1])
                return return_value, msg if msg != nil
            end

            # do podminka
            return_value, msg = @condition[0].run(env, @condition[1])
            return return_value, msg if msg != nil

            # vloz instrukci skoku pokud bude rovno
            env.write_opcode(JEQ)
            env.insert_hook(true_label)

            # vynoril jsem se
            env.return_rise


            return nil, nil
        end

    end

end


