# encoding: utf-8

require './lib/giraffe/debug.rb'
require './lib/giraffe/opcodes.rb'

# Funkce operátorů - generují opcode dle funkce
module Operators

    include Debug

    # Sčítání
    def Operators.add
        return Opcodes::ADD, nil
    end

    # Odčítání
    def Operators.sub
        return Opcodes::SUB, nil
    end

    # Násobení
    def Operators.mul
        return Opcodes::MUL, nil
    end

    # Dělení (celočíselné)
    def Operators.div
        return Opcodes::DIV, nil
    end

    # Zbytek po dělení
    def Operators.mod
        return Opcodes::MOD, nil
    end

    # Porovnání - není rovno
    def Operators.ne
        return Opcodes::NE, nil
    end

    # Porovnání - větší než
    def Operators.gt
        return Opcodes::GT, nil
    end

    # Porovnání - větší rovno
    def Operators.ge
        return Opcodes::GE, nil
    end

    # Porovnání - menší než
    def Operators.lt
        return Opcodes::LT, nil
    end

    # Porovnání - menší rovno
    def Operators.le
        return Opcodes::LE, nil
    end

    # Porovnání - rovno
    def Operators.eq
        return Opcodes::EQ, nil
    end

    # Logický součet
    def Operators.or
        return Opcodes::OR, nil
    end

    # Logický součin
    def Operators.and
        return Opcodes::AND, nil
    end

    # Záporné číslo - násobení -1
    def Operators.neg
        return Opcodes::NEG, nil
    end

    # Negace
    def Operators.not
        return Opcodes::NOT, nil
    end

end
