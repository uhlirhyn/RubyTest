require './lib/giraffe/debug.rb'
require './lib/giraffe/opcodes.rb'

module Giraffe

    class AssignTree
    
        include Debug
        include Opcodes
        
        def initialize(id,expression)
            @id = id
            @expression = expression
            dbg("init",:AssignTree)
        end

        def run(env,tree)

            # AssignTree
            # - zadnou zpravu nezpracovava
            # - neprodukuje zadnou zpravu
            # - normalni vystup je hodnota prirazeni

            dbg("run",:AssignTree)
            
            return_value, msg = @expression[0].run(env,@expression[1])
            return return_value, msg if msg != nil

            dbg("assigning '#{@id}' to '#{return_value}'",:AssignTree)

            # proved zapis do promenne @id
            env.var!(@id)

            return return_value, nil
        end

    end

end


