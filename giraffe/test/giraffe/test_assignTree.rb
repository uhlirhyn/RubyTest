# encoding: utf-8

require_relative "../../lib/giraffe/tree/assignTree.rb"
require_relative '../../lib/giraffe/env.rb'
require_relative '../../lib/giraffe/opcodes.rb'
require_relative 'test_utils.rb'
require 'test/unit'

module Giraffe

    class TestAssignTree < Test::Unit::TestCase

        def test_run            
            env = Env.new
            dummy_exp = [DummyTree.new,"exp"]
            dummy_trg = [DummyTree.new,"trg"]
            dummy_AST = DummyAST.new

            tree = AssignTree.new(dummy_trg,dummy_exp)
            return_value, msg = tree.run(env, dummy_AST)

            assert_equal(return_value, nil)
            assert_equal(msg, nil)

            assert_equal(dummy_exp[0].executed, true)
            assert_equal(dummy_trg[0].executed, true)
            assert_equal(dummy_exp[0].tree, dummy_exp[1])
            assert_equal(dummy_trg[0].tree, dummy_trg[1])
            assert_equal(dummy_exp[0].env.object_id, env.object_id)
            assert_equal(dummy_trg[0].env.object_id, env.object_id)
            assert_equal(dummy_trg[0].method, :store)
            
            env.codegen.seal_function

            dummy = DummyTree.new(true)
            tree = AssignTree.new([dummy,"ast"],dummy_exp)
            return_value, msg = tree.run(env, dummy_AST)

            assert_equal(return_value, "err")
            assert_equal(msg, :error)

            tree = AssignTree.new(dummy_trg,[dummy,"ast"])
            return_value, msg = tree.run(env, dummy_AST)

            assert_equal(return_value, "err")
            assert_equal(msg, :error)
        end

    end
end




