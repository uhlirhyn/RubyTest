require './lib/giraffe/env.rb'
require './lib/giraffe/debug.rb'
require './lib/giraffe/opcodes.rb'

module Giraffe

    class CallTree

        include Debug
        include Opcodes

        def initialize(id,args)
            @id = id
            @args = args
        end

        def run(env,tree)
            @tree = tree

            dbg("run #{tree.line},#{tree.column}",:CallTree)

            # vyzvedni deklaraci funkce
            func, msg = env.func(@id,@args)
            return func, msg if msg != nil

            # proved push argumentu pro funkci
            for a in @args
                return_value, msg = a[0].run(env,a[1])
                return return_value, msg if msg != nil
            end

            # zavolej funkci
            env.write_opcode(CALL)

            return return_value, msg
        end

    end
end


