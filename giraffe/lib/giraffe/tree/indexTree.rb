require_relative '../debug.rb'
require_relative '../opcodes.rb'

module Giraffe

    class IndexTree
    
        include Debug
        include Opcodes

        def initialize(target,index)
            @target = target
            @index = index      # to muze byt expression
            dbg("init",:IndexTree)            
        end

        def run(env,tree,direction=:load)

            dbg("run",:IndexTree) 
            
            # vypocitej index
            return_value, msg = @index[0].run(env,@index[1])
            return return_value, msg if msg != nil

            # vypocitej "adresu"
            return_value, msg = @target[0].run(env,@target[1])
            return return_value, msg if msg != nil

            # zde uloha IndexTree konci
            # - ziskal adresu pole
            # - ziskal index
           
            # ted se muze na hodnoty na stacku 
            # zavolat load
            # nebo tam pridat hodnotu a na tu
            # ulozit na zminenou adresu a index

            if direction == :load
                env.write_opcode(LD)
            else 
                env.write_opcode(ST)
            end
            
            return nil, nil
        end

    end

end


