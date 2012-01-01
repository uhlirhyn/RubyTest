# encoding: utf-8

require_relative "../../lib/giraffe/tree/varTree.rb"
require_relative '../../lib/giraffe/env.rb'
require_relative '../../lib/giraffe/opcodes.rb'
require_relative 'test_utils.rb'
require 'test/unit'

module Giraffe

    class VarTree
        def puts(what)
        end
    end

    class TestVarTree < Test::Unit::TestCase

        def test_run            
            env = Env.new
            dummy_AST = DummyAST.new

            env.var!("a")

            tree = VarTree.new("a")
            return_value, msg = tree.run(env, dummy_AST)

            assert_equal(return_value, nil)
            assert_equal(msg, nil)
           
            env.codegen.seal_function

            assert_equal(env.codegen.bytecode[4].value, Opcodes::PUSH)
            assert_equal(env.codegen.bytecode[5].value, Opcodes::INTEGER)
            assert_equal(env.codegen.bytecode[6].value, 0x00)
            assert_equal(env.codegen.bytecode[7].value, 0x00)
            assert_equal(env.codegen.bytecode[8].value, 0x00)
            assert_equal(env.codegen.bytecode[9].value, 0x00)
            assert_equal(env.codegen.bytecode[10].value, Opcodes::PSL)
            assert_equal(env.codegen.bytecode[11].value, 0x00)
            assert_equal(env.codegen.bytecode[12].value, 0x00)
            assert_equal(env.codegen.bytecode[13].value, 0x00)
            assert_equal(env.codegen.bytecode[14].value, 0x00)
            assert_equal(env.codegen.bytecode[15].value, Opcodes::PLS)
            assert_equal(env.codegen.bytecode[16].value, 0x00)
            assert_equal(env.codegen.bytecode[17].value, 0x00)
            assert_equal(env.codegen.bytecode[18].value, 0x00)
            assert_equal(env.codegen.bytecode[19].value, 0x00)

            tree = VarTree.new("b")
            return_value, msg = tree.run(env, dummy_AST)

            assert_equal(msg, :error)
        end

        def test_run_arg            
            env = Env.new
            dummy_AST = DummyAST.new

            env.register_params(["a"])

            tree = VarTree.new("a")
            return_value, msg = tree.run(env, dummy_AST)

            assert_equal(return_value, nil)
            assert_equal(msg, nil)
           
            env.codegen.seal_function

            assert_equal(env.codegen.bytecode[4].value, Opcodes::PAS)
            assert_equal(env.codegen.bytecode[5].value, 0x00)
            assert_equal(env.codegen.bytecode[6].value, 0x00)
            assert_equal(env.codegen.bytecode[7].value, 0x00)
            assert_equal(env.codegen.bytecode[8].value, 0x00)

        end

        def test_run_store            
            env = Env.new
            dummy_AST = DummyAST.new

            tree = VarTree.new("a")
            return_value, msg = tree.run(env, dummy_AST, :store)

            assert_equal(return_value, nil)
            assert_equal(msg, nil)
           
            env.codegen.seal_function

            assert_equal(env.codegen.bytecode[4].value, Opcodes::PUSH)
            assert_equal(env.codegen.bytecode[5].value, Opcodes::INTEGER)
            assert_equal(env.codegen.bytecode[6].value, 0x00)
            assert_equal(env.codegen.bytecode[7].value, 0x00)
            assert_equal(env.codegen.bytecode[8].value, 0x00)
            assert_equal(env.codegen.bytecode[9].value, 0x00)
            assert_equal(env.codegen.bytecode[10].value, Opcodes::PSL)
            assert_equal(env.codegen.bytecode[11].value, 0x00)
            assert_equal(env.codegen.bytecode[12].value, 0x00)
            assert_equal(env.codegen.bytecode[13].value, 0x00)
            assert_equal(env.codegen.bytecode[14].value, 0x00)

        end

        def test_run_arg_store            
            env = Env.new
            dummy_AST = DummyAST.new

            env.register_params(["a"])

            tree = VarTree.new("a")
            return_value, msg = tree.run(env, dummy_AST, :store)

            assert_equal(return_value, nil)
            assert_equal(msg, nil)
           
            env.codegen.seal_function

            assert_equal(env.codegen.bytecode[4].value, Opcodes::PSA)
            assert_equal(env.codegen.bytecode[5].value, 0x00)
            assert_equal(env.codegen.bytecode[6].value, 0x00)
            assert_equal(env.codegen.bytecode[7].value, 0x00)
            assert_equal(env.codegen.bytecode[8].value, 0x00)

        end


    end
end




