require './lib/giraffe/debug.rb'
require './lib/giraffe/opcodes.rb'

module Giraffe

    class AtomTree

        include Debug
        include Opcodes
        
        def initialize(value)
            @value = value
        end

        def run(env, tree)

            dbg("run",:AtomTree)
            dbg("value '#{@value}'",:AtomTree)

            env.write_opcode(PUSH)
            env.write_int(@value)
            
            # Giraffe zatim s nicim jinym
            # nez s cisly neumi pracovat
            return :number, nil
        end

    end

end


