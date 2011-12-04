require './lib/giraffe/debug.rb'
require './lib/giraffe/opcodes.rb'

module Operators

    include Debug

    def Operators.add(x,y)
        return Opcodes::ADD, nil
    end

    def Operators.sub(x,y)
        return Opcodes::SUB, nil
    end

    def Operators.mul(x,y)
        return Opcodes::MUL, nil
    end

    def Operators.div(x,y)
        return Opcodes::DIV, nil
    end

    def Operators.mod(x,y)
        return Opcodes::MOD, nil
    end

    def Operators.ne(x,y)
        return Opcodes::NE, nil
    end

    def Operators.gt(x,y)
        return Opcodes::GT, nil
    end

    def Operators.ge(x,y)
        return Opcodes::GE, nil
    end

    def Operators.lt(x,y)
        return Opcodes::LT, nil
    end

    def Operators.le(x,y)
        return Opcodes::LE, nil
    end

    def Operators.eq(x,y)
        return Opcodes::EQ, nil
    end

    def Operators.or(x,y)
        return Opcodes::OR, nil
    end

    def Operators.and(x,y)
        return Opcodes::AND, nil
    end

    def Operators.neg(x)
        return Opcodes::NEG, nil
    end

end
