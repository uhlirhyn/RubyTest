require './lib/giraffe/debug.rb'
require './lib/giraffe/opcodes.rb'

module Giraffe

    class IndexTree
    
        include Debug
        include Opcodes

        def initialize(target,index)
            @target = target
            @index = index      # to muze byt expression
            dbg("init",:IndexTree)
        end

        def run(env,tree)

            dbg("run",:IndexTree) 
            
            # vypocitej "adresu"
            returnValue, msg = @target[0].run(env,@target[1])
            return returnValue, msg if msg != nil

            # vypocitej index
            returnValue, msg = @index[0].run(env,@index[1])
            return returnValue, msg if msg != nil

            # zde uloha IndexTree konci
            # - ziskal adresu pole
            # - ziskal index
           
            # ted se muze na hodnoty na stacku 
            # zavolat load
            # nebo tam pridat hodnotu a na tu
            # ulozit na zminenou adresu a index

            return nil, nil
        end

    end

end


