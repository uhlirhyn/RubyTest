# encoding: utf-8

require_relative '../debug.rb'
require_relative '../opcodes.rb'

module Giraffe

    # Generuje bytecode cyklu while
    class WhileTree

        include Debug
        include Opcodes

        # * <tt>condition</tt> AST podmínky
        # * <tt>instructions</tt> pole AST instrukcí
        def initialize(condition,instructions)
            @condition = condition
            @instructions = instructions
        end

        # Provede traverzaci AST a vygeneruje bytecode
        # * <tt>env</tt> je předávané prostředí Env
        # * <tt>tree</tt> je soubor informací z parsersu (line, column)
        def run(env, tree)

            dbg("run",:WhileTree)
            dbg("@instructions.size #{@instructions == nil ? nil : @instructions.size}",:WhileTree)
          
            # vyzvedni si navesti
            loop_label = env.next_label
            
            # vloz kotvu navesti
            env.insert_anchor(loop_label)
 
            # while podminka pri prvnim spusteni
            return_value, msg = @condition[0].run(env,@condition[1])
            return return_value, msg if msg != nil

            # vloz instrukci skoku pokud nebude rovno
            env.write_opcode(JNEQ)

            # obstarej si navesti (hak)
            # a vloz ho do sablony bytecodu
            false_label = env.next_label
            env.insert_hook(false_label)

            # jsem v cykl casti
            env.return_branch_cycle

            for i in @instructions do 
                return_value, msg = i[0].run(env,i[1])
                return return_value, msg if msg != nil
            end

            # vynoril jsem se
            env.return_rise
 
            # az se provede telo cyklu 
            # je potreba skocit zase na zacatek
            env.write_opcode(JMP)
            
            # zaloz hak pro jump
            env.insert_hook(loop_label)

            # vloz kotvu navesti
            env.insert_anchor(false_label)

            return nil, nil
        end

    end

end


