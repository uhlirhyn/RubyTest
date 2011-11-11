require './lib/giraffe/env.rb'

module Giraffe

    class BlockTree

        def initialize()

            # zaloz si scope
            @env = Env.new(env)

            # inicializuj list instrukci
            @instructions = []
        end

        def addInstructions!(instructions)
            @instructions + instructions
        end

        def addInstruction!(instruction)
            @instructions << instruction
        end

        def run(env)
            env.raise
            for i in @instructions do i.run(env) end
            env.descend
        end

        attr_accessor :env

    end

end


