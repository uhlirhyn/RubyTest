require_relative '../../lib/pentomino/desk.rb'
require_relative '../../lib/pentomino/brick.rb'
require 'test/unit'

module Pentomino

    class TestDesk < Test::Unit::TestCase

        def test_desk
            desk = Desk.new(10,20)
            assert_equal(10, desk.w)
            assert_equal(20, desk.h)
        end

        def test_insert
            desk = Desk.new(10,10)
            brick = Brick.new(5,2,0,:lt)
            assert_equal(true, desk.insert(brick))
            brick = Brick.new(5,2,1,:lt)
            assert_equal(true, desk.insert(brick,5,2))
            brick = Brick.new(4,2,2,:lt)
            assert_equal(true, desk.insert(brick,0,2))
            brick = Brick.new(4,2,3,:lt)
            assert_equal(true, desk.insert(brick,2,5))
            brick = Brick.new(4,2,4,:lt)
            assert_equal(true, desk.insert(brick,5,0))
            brick = Brick.new(4,2,5,:rb)
            assert_equal(false, desk.insert(brick,2,5))
            brick = Brick.new(4,2,5,:rb)
            assert_equal(true, desk.insert(brick,3,5))
            brick = Brick.new(4,2,6,:lt)
            assert_equal(true, desk.insert(brick,5,7))
            desk.show
            puts; desk.show_gui
        end

    end

end
