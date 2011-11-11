module Giraffe

    class IfTree
    
        def initialize(condition,blockIf,blockElse=nil)
            @condition = condition
            @blockIf = blockIf
            @blockElse = blockElse
        end

        def run(env)
            if @condition.run(env)
                @blockIf.run(env)
            elsif @blockElse != nil
                @blockElse.run(env)
            end
        end

    end

end


