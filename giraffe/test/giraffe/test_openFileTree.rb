# encoding: utf-8

require_relative "../../lib/giraffe/tree/openFileTree.rb"
require_relative '../../lib/giraffe/env.rb'
require_relative '../../lib/giraffe/opcodes.rb'
require_relative 'test_utils.rb'
require 'test/unit'

module Giraffe

    class TestOpenFileTree < Test::Unit::TestCase

        def test_run            
            env = Env.new
            dummy_exp = DummyTree.new
            dummy_mode = DummyTree.new
            dummy_AST = DummyAST.new
            
            tree = OpenFileTree.new([dummy_exp,"ast"],[dummy_mode,"dummy_mode"])
            return_value, msg = tree.run(env, dummy_AST)

            assert_equal(return_value, nil)
            assert_equal(msg, nil)

            assert_equal(dummy_exp.executed, true)
            assert_equal(dummy_exp.tree, "ast")
            assert_equal(dummy_exp.env.object_id, env.object_id)
            assert_equal(dummy_mode.executed, true)
            assert_equal(dummy_mode.tree, "dummy_mode")
            assert_equal(dummy_mode.env.object_id, env.object_id)

            env.codegen.seal_function

            assert_equal(env.codegen.bytecode[4].value, Opcodes::FO)

            dummy = DummyTree.new(true)
            tree = OpenFileTree.new([dummy_exp,"ast"],[dummy,"dummy_mode"])
            return_value, msg = tree.run(env, dummy_AST)

            assert_equal(return_value, "err")
            assert_equal(msg, :error)

            tree = OpenFileTree.new([dummy,"ast"],[dummy_mode,"dummy_mode"])
            return_value, msg = tree.run(env, dummy_AST)

            assert_equal(return_value, "err")
            assert_equal(msg, :error)

        end

    end
end




