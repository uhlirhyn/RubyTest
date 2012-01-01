# encoding: utf-8

require_relative "../../lib/giraffe/tree/writeFileTree.rb"
require_relative '../../lib/giraffe/env.rb'
require_relative '../../lib/giraffe/opcodes.rb'
require_relative 'test_utils.rb'
require 'test/unit'

module Giraffe

    class TestWriteFileTree < Test::Unit::TestCase

        def test_run            
            env = Env.new
            dummy_exp = DummyTree.new
            dummy_fd = DummyTree.new
            dummy_AST = DummyAST.new
            
            tree = WriteFileTree.new([dummy_fd,"fd"],[dummy_exp,"exp"],false)
            return_value, msg = tree.run(env, dummy_AST)

            assert_equal(return_value, nil)
            assert_equal(msg, nil)

            assert_equal(dummy_exp.executed, true)
            assert_equal(dummy_exp.tree, "exp")
            assert_equal(dummy_exp.env.object_id, env.object_id)
            assert_equal(dummy_fd.executed, true)
            assert_equal(dummy_fd.tree, "fd")
            assert_equal(dummy_fd.env.object_id, env.object_id)

            env.codegen.seal_function

            assert_equal(env.codegen.bytecode[4].value, Opcodes::WF)

            dummy = DummyTree.new(true)
            tree = WriteFileTree.new([dummy_fd,"fd"],[dummy,"exp"],false)
            return_value, msg = tree.run(env, dummy_AST)

            assert_equal(return_value, "err")
            assert_equal(msg, :error)

            tree = WriteFileTree.new([dummy,"fd"],[dummy_fd,"exp"],false)
            return_value, msg = tree.run(env, dummy_AST)

            assert_equal(return_value, "err")
            assert_equal(msg, :error)

        end

        def test_run_alone
            env = Env.new
            dummy_exp = DummyTree.new
            dummy_fd = DummyTree.new
            dummy_AST = DummyAST.new
            
            tree = WriteFileTree.new([dummy_fd,"fd"],[dummy_exp,"exp"],true)
            return_value, msg = tree.run(env, dummy_AST)

            assert_equal(return_value, nil)
            assert_equal(msg, nil)

            assert_equal(dummy_exp.executed, true)
            assert_equal(dummy_exp.tree, "exp")
            assert_equal(dummy_exp.env.object_id, env.object_id)
            assert_equal(dummy_fd.executed, true)
            assert_equal(dummy_fd.tree, "fd")
            assert_equal(dummy_fd.env.object_id, env.object_id)

            env.codegen.seal_function

            assert_equal(env.codegen.bytecode[4].value, Opcodes::WF)
            assert_equal(env.codegen.bytecode[5].value, Opcodes::POP)

            dummy = DummyTree.new(true)
            tree = WriteFileTree.new([dummy_fd,"fd"],[dummy,"exp"],true)
            return_value, msg = tree.run(env, dummy_AST)

            assert_equal(return_value, "err")
            assert_equal(msg, :error)

            tree = WriteFileTree.new([dummy,"fd"],[dummy_fd,"exp"],true)
            return_value, msg = tree.run(env, dummy_AST)

            assert_equal(return_value, "err")
            assert_equal(msg, :error)

        end

    end
end




