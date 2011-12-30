# encoding: utf-8

require_relative "../../lib/giraffe/tree/allocTree.rb"
require_relative '../../lib/giraffe/env.rb'
require_relative '../../lib/giraffe/opcodes.rb'
require_relative 'test_utils.rb'
require 'test/unit'

module Giraffe

    class TestAllocTree < Test::Unit::TestCase

        def test_run            
            env = Env.new
            dummy = DummyTree.new
            dummy_AST = DummyAST.new
            
            tree = AllocTree.new([dummy,"ast"])
            return_value, msg = tree.run(env, dummy_AST)

            assert_equal(return_value, nil)
            assert_equal(msg, nil)

            assert_equal(dummy.executed, true)
            assert_equal(dummy.tree, "ast")
            assert_equal(dummy.env.object_id, env.object_id)

            env.codegen.seal_function

            assert_equal(env.codegen.bytecode[4].value, Opcodes::CALLOC)

            dummy = DummyTree.new(true)
            tree = AllocTree.new([dummy,"ast"])
            return_value, msg = tree.run(env, dummy_AST)

            assert_equal(return_value, "err")
            assert_equal(msg, :err)

        end

    end
end




