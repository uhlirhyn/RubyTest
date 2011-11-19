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
            return_value, msg = @expression.run(env)
            return return_value, msg if msg != nil

            dbg("assigning '#{@id}' to '#{return_value}'",:AssignTree)

            # prirad hodnotu
            env.var!(@id,return_value)
            return return_value, nil
        end

    end

end


