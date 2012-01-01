require_relative '../debug.rb'
require_relative'../opcodes.rb'

module Giraffe

    class NilTree

        include Debug
        include Opcodes

        def run(env, tree)

            dbg("run",:NilTree)

            env.write_opcode(PUSH)
            env.write_nil
            
            return nil, nil
        end

    end

end


