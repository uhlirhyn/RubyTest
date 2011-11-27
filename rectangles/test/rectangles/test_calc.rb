require_relative "../../lib/rectangles/calc.rb"
require_relative "../../lib/rectangles/rectangle.rb"
require 'test/unit'

module Rectangle

    class TestCalc < Test::Unit::TestCase

        def test_count_dy
            c = Calc.new([Rectangle.new(4,0,0),Rectangle.new(4,0,2)])
            assert_equal(c.count_dy,2)
            c = Calc.new([Rectangle.new(4,0,0),Rectangle.new(2,0,0)])
            assert_equal(c.count_dy,2)
            c = Calc.new([Rectangle.new(4,0,0),Rectangle.new(4,0,0)])
            assert_equal(c.count_dy,4)
            c = Calc.new([Rectangle.new(4,0,0),Rectangle.new(4,0,4)])
            assert_equal(c.count_dy,0)
            c = Calc.new([Rectangle.new(4,0,0),Rectangle.new(4,0,5)])
            assert_equal(c.count_dy,-1)
        end

        def test_count_dx
            c = Calc.new([Rectangle.new(4,0,0),Rectangle.new(4,2,0)])
            assert_equal(c.count_dx,2)
            c = Calc.new([Rectangle.new(4,0,0),Rectangle.new(2,0,0)])
            assert_equal(c.count_dx,2)
            c = Calc.new([Rectangle.new(4,0,0),Rectangle.new(4,0,0)])
            assert_equal(c.count_dx,4)
            c = Calc.new([Rectangle.new(4,0,0),Rectangle.new(4,4,0)])
            assert_equal(c.count_dx,0)
            c = Calc.new([Rectangle.new(4,0,0),Rectangle.new(4,5,0)])
            assert_equal(c.count_dx,-1)
        end

        def test_calculate
            c = Calc.new([Rectangle.new(4,0,0),Rectangle.new(2,2,2)])
            assert_equal(c.calculate,19)
            c = Calc.new([Rectangle.new(4.0,0.0,0e-3),Rectangle.new(2e+0,-2,-2e0)])
            assert_equal(c.calculate,19)
            c = Calc.new([Rectangle.new(5.23,-10e20,3e-2),Rectangle.new(4.345643225,3e100,-1)])
            assert_equal(c.calculate,nil)
            # dotek hranou
            c = Calc.new([Rectangle.new(4,0,0),Rectangle.new(4,0,4)])
            assert_equal(c.calculate,32)
            c = Calc.new([Rectangle.new(4,0,0),Rectangle.new(4,4,0)])
            assert_equal(c.calculate,32)
            # dotek rohem
            c = Calc.new([Rectangle.new(4,0,0),Rectangle.new(4,4,4)])
            assert_equal(c.calculate,32)
            # nedotykaji se 
            c = Calc.new([Rectangle.new(4,0,0),Rectangle.new(4,0,5)])
            assert_equal(c.calculate,nil)
        end

    end

end
