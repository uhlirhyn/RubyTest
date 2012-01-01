# encoding: utf-8

require_relative "../../lib/giraffe/tree/programTree.rb"
require_relative '../../lib/giraffe/env.rb'
require_relative '../../lib/giraffe/opcodes.rb'
require_relative 'test_utils.rb'
require 'test/unit'

module Giraffe

    class TestProgramTree < Test::Unit::TestCase

        def test_run            
            dummy_fnc = [[DummyTree.new,"fnc"]]

            tree = ProgramTree.new(dummy_fnc)
            return_value, msg = tree.run

            assert_equal(return_value.instance_of?(Codegen),true)
            assert_equal(msg, nil)

            for i in dummy_fnc do 
                assert_equal(i[0].executed, true)
                assert_equal(i[0].tree, i[1])
            end

            dummy = [DummyTree.new(true),"fnc"]
            tree = ProgramTree.new([dummy])
            return_value, msg = tree.run

            assert_equal(return_value, "err")
            assert_equal(msg, :error)

        end

    end
end




