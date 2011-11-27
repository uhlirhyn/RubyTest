require_relative "../../lib/minimal/solver.rb"
require 'test/unit'

module Minimal

    class TestReader < Test::Unit::TestCase

        def test_is_in
            s = Solver.new
            assert_equal(s.is_in?(1,[0,5]),true)
            assert_equal(s.is_in?(0,[0,5]),true)
            assert_equal(s.is_in?(5,[0,5]),true)
            assert_equal(s.is_in?(0,[1,5]),false)
            assert_equal(s.is_in?(5,[0,4]),false)
        end

        def test_merge
            s = Solver.new
            assert_equal(s.merge([0,5],[]),[0,5])
            assert_equal(s.merge([],[0,5]),[0,5])
            assert_equal(s.merge([0,5],[5,8]),[0,8])
            assert_equal(s.merge([5,8],[0,5]),[0,8])
            assert_equal(s.merge([0,5],[2,3]),[0,5])
            assert_equal(s.merge([0,5],[-1,8]),[-1,8])
        end

        def test_crossing
            s = Solver.new
            assert_equal(s.crossing?([0,5],[0,5]),true)
            assert_equal(s.crossing?([0,5],[4,5]),true)
            assert_equal(s.crossing?([4,5],[0,5]),true)
            assert_equal(s.crossing?([0,5],[6,7]),false)
        end

        def test_subset
            s = Solver.new
            assert_equal(s.subset([0,5],[0,5]),true)
            assert_equal(s.subset([0,5],[0,4]),true)
            assert_equal(s.subset([0,5],[5,5]),true)
            assert_equal(s.subset([0,5],[0,0]),true)
            assert_equal(s.subset([0,5],[4,4]),true)
            assert_equal(s.subset([0,5],[0,6]),false)
            assert_equal(s.subset([0,5],[4,6]),false)
            assert_equal(s.subset([0,5],[6,7]),false)
        end

    end

end 
