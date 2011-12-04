require './lib/giraffe/debug.rb'

module Giraffe

    class DeclareTree

        include Debug

        def initialize(id,type)
            @id = id
            @type = type
        end

        def where
            "\n\tin function '#{@id}' on line #{@tree.line}, column #{@tree.column}\n"
        end

        # DeclareTree
        #
        # Deklaruje promenne
        # 
        def run(env,tree)
        
            @tree = tree

            dbg("run",:DeclareTree)

            return_value, msg = env.declare(@id,@type) 
            if msg == :error
                puts red("Error: ") + 
                    orange("Variable '#{id}' is already declared as #{variable.type} variable") +
                    where
                return nil, :error
            end

            return return_value, nil

        end
        
    end

end


