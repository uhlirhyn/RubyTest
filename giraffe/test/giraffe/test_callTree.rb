# encoding: utf-8

require_relative "../../lib/giraffe/tree/callTree.rb"
require_relative '../../lib/giraffe/env.rb'
require_relative '../../lib/giraffe/opcodes.rb'
require_relative 'test_utils.rb'
require 'test/unit'

module Giraffe

    class CallTree
        def puts(what)
        end
    end

    class TestCallTree < Test::Unit::TestCase

        def test_run            
            env = Env.new
            dummy_arg1 = [DummyTree.new,"dummy_arg1"]
            dummy_arg3 = [DummyTree.new,"dummy_arg2"]
            dummy_arg2 = [DummyTree.new,"dummy_arg3"]
            env.func!("fce1",["a","b","c"])
            
            dummy_AST = DummyAST.new

            tree = CallTree.new("fce1",[dummy_arg1,dummy_arg2,dummy_arg3],false)
            return_value, msg = tree.run(env, dummy_AST)

            assert_equal(return_value, nil)
            assert_equal(msg, nil)

            assert_equal(dummy_arg1[0].executed, true)
            assert_equal(dummy_arg2[0].executed, true)
            assert_equal(dummy_arg3[0].executed, true)
            assert_equal(dummy_arg1[0].tree, dummy_arg1[1])
            assert_equal(dummy_arg2[0].tree, dummy_arg2[1])
            assert_equal(dummy_arg3[0].tree, dummy_arg3[1])
            assert_equal(dummy_arg1[0].env.object_id, env.object_id)
            assert_equal(dummy_arg2[0].env.object_id, env.object_id)
            assert_equal(dummy_arg3[0].env.object_id, env.object_id)
            
            env.codegen.seal_function

            assert_equal(env.codegen.bytecode[4].value, Opcodes::CALL)
            assert_equal(env.codegen.bytecode[5].value, 0)
            assert_equal(env.codegen.bytecode[6].value, 0)
            assert_equal(env.codegen.bytecode[7].value, 0)
            assert_equal(env.codegen.bytecode[8].value, 4)
            assert_equal(env.codegen.bytecode[9].value, Opcodes::POP)
            assert_equal(env.codegen.bytecode[10].value, Opcodes::POP)
            assert_equal(env.codegen.bytecode[11].value, Opcodes::POP)
            assert_equal(env.codegen.bytecode[12].value, Opcodes::RER)

            dummy = [DummyTree.new(true),"arg"]
            tree = CallTree.new("fce1",[dummy_arg1,dummy_arg2,dummy,dummy_arg3],false)
            return_value, msg = tree.run(env, dummy_AST)

            assert_equal(msg, :error)
        end

        def test_run_undeclared
            env = Env.new
            dummy_arg1 = [DummyTree.new,"dummy_arg1"]
            dummy_arg3 = [DummyTree.new,"dummy_arg2"]
            dummy_arg2 = [DummyTree.new,"dummy_arg3"]
            dummy_AST = DummyAST.new

            tree = CallTree.new("fce1",[dummy_arg1,dummy_arg2,dummy_arg3],false)
            return_value, msg = tree.run(env, dummy_AST)

            assert_equal(msg, :error)
        end

        def test_run_alone
            env = Env.new
            dummy_arg1 = [DummyTree.new,"dummy_arg1"]
            dummy_arg3 = [DummyTree.new,"dummy_arg2"]
            dummy_arg2 = [DummyTree.new,"dummy_arg3"]
            env.func!("fce1",["a","b","c"])
            
            dummy_AST = DummyAST.new

            tree = CallTree.new("fce1",[dummy_arg1,dummy_arg2,dummy_arg3],true)
            return_value, msg = tree.run(env, dummy_AST)

            assert_equal(return_value, nil)
            assert_equal(msg, nil)

            assert_equal(dummy_arg1[0].executed, true)
            assert_equal(dummy_arg2[0].executed, true)
            assert_equal(dummy_arg3[0].executed, true)
            assert_equal(dummy_arg1[0].tree, dummy_arg1[1])
            assert_equal(dummy_arg2[0].tree, dummy_arg2[1])
            assert_equal(dummy_arg3[0].tree, dummy_arg3[1])
            assert_equal(dummy_arg1[0].env.object_id, env.object_id)
            assert_equal(dummy_arg2[0].env.object_id, env.object_id)
            assert_equal(dummy_arg3[0].env.object_id, env.object_id)
            
            env.codegen.seal_function

            assert_equal(env.codegen.bytecode[4].value, Opcodes::CALL)
            assert_equal(env.codegen.bytecode[5].value, 0)
            assert_equal(env.codegen.bytecode[6].value, 0)
            assert_equal(env.codegen.bytecode[7].value, 0)
            assert_equal(env.codegen.bytecode[8].value, 4)
            assert_equal(env.codegen.bytecode[9].value, Opcodes::POP)
            assert_equal(env.codegen.bytecode[10].value, Opcodes::POP)
            assert_equal(env.codegen.bytecode[11].value, Opcodes::POP)
            assert_equal(env.codegen.bytecode[12].value, Opcodes::RER)
            assert_equal(env.codegen.bytecode[13].value, Opcodes::POP)

        end

    end
end




