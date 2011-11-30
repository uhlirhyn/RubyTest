require './lib/giraffe/debug.rb'
require './lib/giraffe/opcodes.rb'

module Giraffe

    class BreakTree

        include Debug
        include Opcodes
        
        def run(env)

            # BreakTree
            # - produkuje :break
            # - nezpracovava zadnou zpravu
            # - normalni vystup je nil
            
            # TODO: mohl by posilat navesti aby 
            # slo vyskakovat do nadrazenych cyklu

            dbg("run",:BreakTree)
            
            env.write_bytecode(JMP)
            env.write_break_label

            return nil, :break
        end
        
    end

end


