require_relative '../../lib/pentomino/desk.rb'
require_relative '../../lib/pentomino/brick.rb'
require 'test/unit'

module Pentomino

    class TestDesk < Test::Unit::TestCase

        def test_desk
            desk = Desk.new(10,20)
            assert_equal(200, desk.free)
            assert_equal(10, desk.w)
            assert_equal(20, desk.h)
        end

        def test_insert
            brick = Brick.new(5,2,0,:lt)
            desk = Desk.new(10,10)
            desk.show
            assert_equal(true, desk.insert(brick))
            desk.show
        end

    end

end
