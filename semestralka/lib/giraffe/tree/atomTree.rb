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

            env.write_bytecode(IPUSH)
            env.write_bytecode(@value >> 24 & 0xFF)
            env.write_bytecode(@value >> 16 & 0xFF)
            env.write_bytecode(@value >> 8 & 0xFF)
            env.write_bytecode(@value & 0xFF)

            return @value, nil
        end

    end

end


