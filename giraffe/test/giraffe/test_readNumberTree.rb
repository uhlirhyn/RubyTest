# encoding: utf-8

require_relative "../../lib/giraffe/tree/readNumberTree.rb"
require_relative '../../lib/giraffe/env.rb'
require_relative '../../lib/giraffe/opcodes.rb'
require_relative 'test_utils.rb'
require 'test/unit'

module Giraffe

    class TestReadNumberTree < Test::Unit::TestCase

        def test_run            
            env = Env.new
            dummy_exp = [DummyTree.new,"exp"]
            dummy_AST = DummyAST.new

            tree = ReadNumberTree.new(dummy_exp)
            return_value, msg = tree.run(env, dummy_AST)

            assert_equal(return_value, nil)
            assert_equal(msg, nil)

            assert_equal(dummy_exp[0].executed, true)
            assert_equal(dummy_exp[0].tree, "exp")
            assert_equal(dummy_exp[0].env.object_id, env.object_id)
            
            env.codegen.seal_function

            assert_equal(env.codegen.bytecode[4].value, Opcodes::RN)

            dummy = DummyTree.new(true)
            tree = ReadNumberTree.new([dummy,"ast"])
            return_value, msg = tree.run(env, dummy_AST)

            assert_equal(return_value, "err")
            assert_equal(msg, :error)
        end

    end
end




