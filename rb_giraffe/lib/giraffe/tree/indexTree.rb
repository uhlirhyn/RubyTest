require './lib/giraffe/debug.rb'

module Giraffe

    class IndexTree
    
        include Debug

        def initialize(target,index)
            @target = target
            @index = index      # to muze byt expression
            dbg("init",:IndexTree)
        end

        def run(env,tree)

            # IndexTree
            # - zadnou zpravu nezpracovava
            # - neprodukuje zadnou zpravu
            # - normalni vystup je 

            # vypocitej "adresu"
            returnValue, msg = @target[0].run(env,@target[1])
            return returnValue, msg if msg != nil

            address = returnValue

            # vypocitej index
            returnValue, msg = @index[0].run(env,@index[1])
            return returnValue, msg if msg != nil

            index = returnValue

            dbg("address '#{address}' index '#{index}'",:IndexTree) 
           
            # kontrola pole ... ?

            # vypocitej hodnotu
            return address[index], nil
        end

    end

end


