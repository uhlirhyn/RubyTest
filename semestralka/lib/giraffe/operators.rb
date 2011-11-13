module Operators

    def Operators.add(x,y)
        if x.is_a?(Numeric) && y.is_a?(Numeric) || x.is_a?(String) && y.is_a?(String)
            return x+y 
        else
            raise "Can't add #{x.class} '#{x}' and #{y.class} '#{y}'"
        end
    end

    def Operators.sub(x,y)
        if x.is_a?(Numeric) && y.is_a?(Numeric)
            return x-y 
        else
            raise "Can't substract #{x.class} '#{x}' and #{y.class} '#{y}'"
        end
    end

    def Operators.mul(x,y)
        if x.is_a?(Numeric) && y.is_a?(Numeric)
            return x*y 
        else
            raise "Can't multiply #{x.class} '#{x}' and #{y.class} '#{y}'"
        end
    end

    def Operators.div(x,y)
        if x.is_a?(Numeric) && y.is_a?(Numeric)
            return x/y 
        else
            raise "Can't divide #{x.class} '#{x}' and #{y.class} '#{y}'"
        end
    end

    def Operators.mod(x,y)
        if x.is_a?(Numeric) && y.is_a?(Numeric)
            return x%y 
        else
            raise "Can't find modulo od #{x.class} '#{x}' and #{y.class} '#{y}'"
        end
    end

    def Operators.nq(x,y)
        if x.is_a?(Numeric) && y.is_a?(Numeric)
            return x!=y 
        else
            raise "Can't compare #{x.class} '#{x}' and #{y.class} '#{y}'"
        end
    end

    def Operators.gt(x,y)
        if x.is_a?(Numeric) && y.is_a?(Numeric)
            return x>y 
        else
            raise "Can't compare #{x.class} '#{x}' and #{y.class} '#{y}'"
        end
    end

    def Operators.ge(x,y)
        if x.is_a?(Numeric) && y.is_a?(Numeric)
            return x>=y 
        else
            raise "Can't compare #{x.class} '#{x}' and #{y.class} '#{y}'"
        end
    end

    def Operators.lt(x,y)
        if x.is_a?(Numeric) && y.is_a?(Numeric)
            return x<y 
        else
            raise "Can't compare #{x.class} '#{x}' and #{y.class} '#{y}'"
        end
    end

    def Operators.le(x,y)
        if x.is_a?(Numeric) && y.is_a?(Numeric)
            return x<=y 
        else
            raise "Can't compare #{x.class} '#{x}' and #{y.class} '#{y}'"
        end
    end

    def Operators.eq(x,y)
        if x.is_a?(Numeric) && y.is_a?(Numeric)
            return x==y 
        else
            raise "Can't compare #{x.class} '#{x}' and #{y.class} '#{y}'"
        end
    end
    
    def Operators.or(x,y)
        if x.is_a?(Numeric) && y.is_a?(Numeric)
            return x||y 
        else
            raise "Can't make or between #{x.class} '#{x}' and #{y.class} '#{y}'"
        end
    end

    def Operators.and(x,y)
        if x.is_a?(Numeric) && y.is_a?(Numeric)
            return x&&y 
        else
            raise "Can't make or between #{x.class} '#{x}' and #{y.class} '#{y}'"
        end
    end

    def Operators.neg(x)
        if x.is_a?(Numeric)
            return -x 
        else
            raise "Can't negate #{x.class} '#{x}'"
        end
    end

end
