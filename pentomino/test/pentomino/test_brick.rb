    require_relative '../../lib/pentomino/brick.rb'
require 'test/unit'

module Pentomino

    class TestBrick < Test::Unit::TestCase

        def test_brick_props

            brick = Brick.new(2,5,:new_id,:lt)
            assert_equal(2,brick.w)
            assert_equal(5,brick.h)
            assert_equal(:new_id,brick.id)
            assert_equal(:lt,brick.orientation)

        end

        def test_brick_orientation

            brick = Brick.new(3,5,0,:lt)
=begin

    ###
    #
    #
    #
    #

=end
            assert_equal([[0,0,0,0,0],[
                         0,nil,nil,nil,nil],
                         [0,nil,nil,nil,nil]],brick.slices)

            brick = Brick.new(6,4,0,:lt)
=begin

    ######
    #
    #
    #

=end
            assert_equal([[0,0,0,0],
                         [0,nil,nil,nil],
                         [0,nil,nil,nil],
                         [0,nil,nil,nil],
                         [0,nil,nil,nil],
                         [0,nil,nil,nil]],
                         brick.slices)

            brick = Brick.new(3,5,0,:rt)
=begin

    ###
      #
      #
      #
      #

=end
            assert_equal([[0,nil,nil,nil,nil],
                         [0,nil,nil,nil,nil],
                         [0,0,0,0,0]],brick.slices)

            brick = Brick.new(6,4,0,:rt)
=begin

    ######
         #
         #
         #

=end
            assert_equal([[0,nil,nil,nil],
                         [0,nil,nil,nil],
                         [0,nil,nil,nil],
                         [0,nil,nil,nil],
                         [0,nil,nil,nil],
                         [0,0,0,0]],
                         brick.slices)

            brick = Brick.new(3,5,0,:rb)
=begin

      #
      #
      #
      #
    ###

=end
            assert_equal([[nil,nil,nil,nil,0],
                         [nil,nil,nil,nil,0],
                         [0,0,0,0,0]],brick.slices)

            brick = Brick.new(6,4,0,:rb)
=begin

         #
         #
         #
    ######

=end
            assert_equal([[nil,nil,nil,0],
                         [nil,nil,nil,0],
                         [nil,nil,nil,0],
                         [nil,nil,nil,0],
                         [nil,nil,nil,0],
                         [0,0,0,0]],
                         brick.slices)

            brick = Brick.new(3,5,0,:lb)
=begin

    #
    #
    #
    #
    ###

=end
            assert_equal([[0,0,0,0,0],
                         [nil,nil,nil,nil,0],
                         [nil,nil,nil,nil,0]],brick.slices)

            brick = Brick.new(6,4,0,:lb)
=begin

    #
    #
    #
    ######

=end
            assert_equal([[0,0,0,0],
                         [nil,nil,nil,0],
                         [nil,nil,nil,0],
                         [nil,nil,nil,0],
                         [nil,nil,nil,0],
                         [nil,nil,nil,0]],
                         brick.slices)

        end

    end

end
