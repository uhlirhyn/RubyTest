# encoding: utf-8

require_relative '../debug.rb'
require_relative'../opcodes.rb'

module Giraffe

    # Generuje NIL hodnotu, resp. instrukce jejího vložení na stack
    class NilTree

        include Debug
        include Opcodes

        # Provede traverzaci AST a vygeneruje bytecode
        # * <tt>env</tt> je předávané prostředí Env
        # * <tt>tree</tt> je soubor informací z parsersu (line, column)
        def run(env, tree)

            dbg("run",:NilTree)

            env.write_opcode(PUSH)
            env.write_nil
            
            return nil, nil
        end

    end

end


