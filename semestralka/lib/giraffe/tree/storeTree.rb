require './lib/giraffe/debug.rb'
require './lib/giraffe/opcodes.rb'

module Giraffe

    class StoreTree
    
        include Debug
        include Opcodes
        
        def initialize(reference)
            @reference = reference
            dbg("init",:StoreTree)
        end
        
        # StoreTree
        #
        # Bere referenci a provadi na ni
        def run(env,tree)
            
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


