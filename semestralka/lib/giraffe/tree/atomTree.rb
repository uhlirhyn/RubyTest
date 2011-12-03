require './lib/giraffe/debug.rb'
require './lib/giraffe/opcodes.rb'

module Giraffe

    class AtomTree

        include Debug
        include Opcodes
        
        def initialize(value)
            @value = value
            dbg("init",:AtomTree)
        end

        def run(env, tree)

            # AtomTree 
            # - nezpracovava zadnou zpravu
            # - neprodukuje zadnou zpravu
            # - normalni vystup je hodnota

            dbg("run",:AtomTree)
            dbg("value '#{@value}'",:AtomTree)

            env.write_opcode(PUSH)
            env.write_int(@value)

            return @value, nil
        end

    end

end


