require './lib/giraffe/debug.rb'

module Giraffe

    class IndexTree
    
        include Debug

        def initialize(target,index)
            @target = target
            @index = index      # to muze byt expression
            dbg("init",:IndexTree)
        end

        def run(env)

            # IndexTree
            # - zadnou zpravu nezpracovava
            # - neprodukuje zadnou zpravu
            # - normalni vystup je 

            # vypocitej "adresu"
            returnValue, msg = @target.run(env)
            return returnValue, msg if msg != nil

            address = returnValue

            # vypocitej index
            returnValue, msg = @index.run(env)
            return returnValue, msg if msg != nil

            index = returnValue

            dbg("address '#{address}' index '#{index}'",:IndexTree) 
            
            # vypocitej hodnotu
            value = returnValue
            return address[index], nil
        end

    end

end


