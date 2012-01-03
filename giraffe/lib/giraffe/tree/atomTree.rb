# encoding: utf-8

require_relative '../debug.rb'
require_relative '../opcodes.rb'

module Giraffe

    # Symbolizuje term - atom (číslo, boolean)
    class AtomTree

        include Debug
        include Opcodes
        
        # * <tt>value</tt> je hodnota
        def initialize(value)
            @value = value
        end

        # Provede traverzaci AST a vygeneruje bytecode
        # * <tt>env</tt> je předávané prostředí Env
        # * <tt>tree</tt> je soubor informací z parsersu (line, column)
        def run(env, tree)

            dbg("run",:AtomTree)
            dbg("value '#{@value}'",:AtomTree)

            env.write_opcode(PUSH)
            env.write_int(@value)
            
            # Giraffe zatim s nicim jinym
            # nez s cisly neumi pracovat
            return nil, nil
        end

    end

end


