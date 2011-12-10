require './lib/giraffe/env.rb'
require './lib/giraffe/debug.rb'
require './lib/giraffe/opcodes.rb'

module Giraffe

    class ForTree

        include Debug
        include Opcodes

        def initialize(assignment1,condition,assignment2,instructions)
            dbg("run",:ForTree)
            @assignment1 = assignment1           
            @condition = condition
            @assignment2 = assignment2            
            @instructions = instructions            
        end

        def run(env,tree)

            @tree = tree
            return_value, msg = innerRun(env)
            return return_value, msg
        end

        private 
        
        def where
            "\n\tin for cycle on line #{@tree.line}, column #{@tree.column}"
        end

        def innerRun(env)

            dbg("run",:ForTree)

            # deklarace
            return_value = msg = nil

            return_value, msg = @assignment1[0].run(env,@assignment1[1])
            return return_value, msg if msg != nil
            dbg("assignment1 OK",:ForTree)

            # vyzvedni si navesti
            loop_label = env.next_label
            
            # vloz kotvu navesti
            env.insert_anchor(loop_label)

            # podminka 
            return_value, msg = @condition[0].run(env,@condition[1])
            return return_value, msg if msg != nil
            dbg("condition OK",:ForTree)

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
                return_value, msg = i[0].run(env,i[1])
                return return_value, msg if msg != nil
            end

            dbg("instructions OK",:ForTree)

            # assignment 
            return_value, msg = @assignment2[0].run(env,@assignment2[1])
            return return_value, msg if msg != nil

            dbg("assignment2 OK",:ForTree)
            
            # az se provede telo cyklu 
            # je potreba skocit zase na zacatek
            env.write_opcode(JMP)
            
            # zaloz hak pro jump
            env.insert_hook(loop_label)

            # vloz kotvu navesti
            # sem se bude vyskakovat z 
            # cyklu az bude neplatna 
            # podminka
            env.insert_anchor(false_label)
                        
            # vynoril jsem se
            env.return_rise

            # ForTree normalne nevraci ani hodnotu ani zpravu
            return nil, nil
        end

    end

end


