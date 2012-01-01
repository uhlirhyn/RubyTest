# encoding: utf-8

require_relative "../../lib/giraffe/tree/indexTree.rb"
require_relative '../../lib/giraffe/env.rb'
require_relative '../../lib/giraffe/opcodes.rb'
require_relative 'test_utils.rb'
require 'test/unit'

module Giraffe

    class TestIndexTree < Test::Unit::TestCase

        def test_run            
            env = Env.new
            dummy_idx = [DummyTree.new,"idx"]
            dummy_trg = [DummyTree.new,"trg"]
            dummy_AST = DummyAST.new

            tree = IndexTree.new(dummy_trg,dummy_idx)
            return_value, msg = tree.run(env, dummy_AST)

            assert_equal(return_value, nil)
            assert_equal(msg, nil)

            assert_equal(dummy_idx[0].executed, true)
            assert_equal(dummy_trg[0].executed, true)
            assert_equal(dummy_idx[0].tree, dummy_idx[1])
            assert_equal(dummy_trg[0].tree, dummy_trg[1])
            assert_equal(dummy_idx[0].env.object_id, env.object_id)
            assert_equal(dummy_trg[0].env.object_id, env.object_id)
            
            env.codegen.seal_function

            assert_equal(env.codegen.bytecode[4].value,Opcodes::LD)

            dummy = DummyTree.new(true)
            tree = IndexTree.new([dummy,"ast"],dummy_idx)
            return_value, msg = tree.run(env, dummy_AST)

            assert_equal(return_value, "err")
            assert_equal(msg, :error)

            tree = IndexTree.new(dummy_trg,[dummy,"ast"])
            return_value, msg = tree.run(env, dummy_AST)

            assert_equal(return_value, "err")
            assert_equal(msg, :error)
        end

        def test_run_store
            env = Env.new
            dummy_idx = [DummyTree.new,"idx"]
            dummy_trg = [DummyTree.new,"trg"]
            dummy_AST = DummyAST.new

            tree = IndexTree.new(dummy_trg,dummy_idx)
            return_value, msg = tree.run(env, dummy_AST, :store)

            assert_equal(return_value, nil)
            assert_equal(msg, nil)

            assert_equal(dummy_idx[0].executed, true)
            assert_equal(dummy_trg[0].executed, true)
            assert_equal(dummy_idx[0].tree, dummy_idx[1])
            assert_equal(dummy_trg[0].tree, dummy_trg[1])
            assert_equal(dummy_idx[0].env.object_id, env.object_id)
            assert_equal(dummy_trg[0].env.object_id, env.object_id)
            
            env.codegen.seal_function

            assert_equal(env.codegen.bytecode[4].value,Opcodes::ST)

            dummy = DummyTree.new(true)
            tree = IndexTree.new([dummy,"ast"],dummy_idx)
            return_value, msg = tree.run(env, dummy_AST)

            assert_equal(return_value, "err")
            assert_equal(msg, :error)

            tree = IndexTree.new(dummy_trg,[dummy,"ast"])
            return_value, msg = tree.run(env, dummy_AST)

            assert_equal(return_value, "err")
            assert_equal(msg, :error)
        end

    end
end




