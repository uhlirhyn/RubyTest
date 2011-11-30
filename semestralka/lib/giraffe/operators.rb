require './lib/giraffe/debug.rb'
require './lib/giraffe/opcodes.rb'

module Operators

    include Debug

    def Operators.add(x,y)
        if x.is_a?(Numeric) && y.is_a?(Numeric) || x.is_a?(String) && y.is_a?(String) || x.is_a?(Array) && y.is_a?(Array)
            return Opcodes::IADD, nil
        else
            return "Can't add #{x.class} '#{x}' and #{y.class} '#{y}'", :error
        end
    end

    def Operators.sub(x,y)
        if x.is_a?(Numeric) && y.is_a?(Numeric)
            return Opcodes::ISUB, nil
        else
            raise "Can't substract #{x.class} '#{x}' and #{y.class} '#{y}'"
        end
    end

    def Operators.mul(x,y)
        if x.is_a?(Numeric) && y.is_a?(Numeric)
            return Opcodes::IMUL, nil
        else
            raise "Can't multiply #{x.class} '#{x}' and #{y.class} '#{y}'"
        end
    end

    def Operators.div(x,y)
        if x.is_a?(Numeric) && y.is_a?(Numeric)
            return Opcodes::IDIV, nil
        else
            raise "Can't divide #{x.class} '#{x}' and #{y.class} '#{y}'"
        end
    end

    def Operators.mod(x,y)
        if x.is_a?(Numeric) && y.is_a?(Numeric)
            return Opcodes::IMOD, nil
        else
            raise "Can't find modulo od #{x.class} '#{x}' and #{y.class} '#{y}'"
        end
    end

    def Operators.ne(x,y)
        if x.is_a?(Numeric) && y.is_a?(Numeric) || x.is_a?(String) && y.is_a?(String)
            return Opcodes::INE, nil
        else 
            raise "Can't compare #{x.class} '#{x}' and #{y.class} '#{y}'"
        end
    end

    def Operators.gt(x,y)
        if x.is_a?(Numeric) && y.is_a?(Numeric)
            return Opcodes::IGT, nil
        else
            raise "Can't compare #{x.class} '#{x}' and #{y.class} '#{y}'"
        end
    end

    def Operators.ge(x,y)
        if x.is_a?(Numeric) && y.is_a?(Numeric)
            return Opcodes::IGE, nil
        else
            raise "Can't compare #{x.class} '#{x}' and #{y.class} '#{y}'"
        end
    end

    def Operators.lt(x,y)
        if x.is_a?(Numeric) && y.is_a?(Numeric)
            return Opcodes::ILT, nil
        else
            return "Can't compare #{x.class} '#{x}' and #{y.class} '#{y}'", :error
        end
    end

    def Operators.le(x,y)
        if x.is_a?(Numeric) && y.is_a?(Numeric)
            return Opcodes::ILE, nil
        else
            raise "Can't compare #{x.class} '#{x}' and #{y.class} '#{y}'"
        end
    end

    def Operators.eq(x,y)
        if x.is_a?(Numeric) && y.is_a?(Numeric) ||  x.is_a?(String) && y.is_a?(String)
            return Opcodes::IEQ, nil
        else
            raise "Can't compare #{x.class} '#{x}' and #{y.class} '#{y}'"
        end
    end

    def Operators.or(x,y)
        if (x.is_a?(TrueClass) || x.is_a?(FalseClass)) && (y.is_a?(TrueClass) || y.is_a?(FalseClass))
            return Opcodes::IOR, nil
        else
            raise "Can't make or between #{x.class} '#{x}' and #{y.class} '#{y}'"
        end
    end

    def Operators.and(x,y)
        if (x.is_a?(TrueClass) || x.is_a?(FalseClass)) && (y.is_a?(TrueClass) || y.is_a?(FalseClass))
            return Opcodes::IAND, nil
        else
            raise "Can't make or between #{x.class} '#{x}' and #{y.class} '#{y}'"
        end
    end

    def Operators.neg(x)
        if x.is_a?(Numeric)
            return Opcodes::INEG 
        else
            raise "Can't negate #{x.class} '#{x}'"
        end
    end

end
