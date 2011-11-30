require './lib/giraffe/debug.rb'
require './lib/giraffe/opcodes.rb'

module Operators

    include Debug

    def Operators.add
        return Opcodes::IADD
    end

end
