module Giraffe

    class AssignTree
    
        def initialize(id,expression)
            @id = id
            @expression = expression
        end

        def run(env)
            env.var!(@id,@expression.run(env))
        end

    end

end


