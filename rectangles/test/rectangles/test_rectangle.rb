require_relative "../../lib/rectangles/rectangle.rb"
require 'test/unit'

module Rectangle

    class TestRectangle < Test::Unit::TestCase

        def test_check_float_ok
            r = Rectangle.new(5,3,2)
            assert_equal(r.x1,0.5)
            assert_equal(r.x2,5.5)
            assert_equal(r.y1,-0.5)
            assert_equal(r.y2,4.5)
        end

    end

end
