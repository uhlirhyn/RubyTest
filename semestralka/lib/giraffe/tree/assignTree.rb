require './lib/giraffe/debug.rb'

module Giraffe

    class AssignTree
    
        include Debug
        
        def initialize(id,expression)
            @id = id
            @expression = expression
            dbg("init",:AssignTree)
        end

        def run(env)

            # AssignTree
            # - zadnou zpravu nezpracovava
            # - neprodukuje zadnou zpravu
            # - normalni vystup je hodnota prirazeni

            dbg("run",:AssignTree)
            
            # vypocitej hodnotu
            returnValue, msg = @expression.run(env)
            return returnValue, msg if msg != nil

            dbg("assigning '#{@id}' to '#{returnValue}'",:AssignTree)

            # prirad hodnotu
            env.var!(@id,returnValue)
            return returnValue, nil
        end

    end

end


