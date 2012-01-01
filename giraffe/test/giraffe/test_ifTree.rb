# encoding: utf-8

require_relative "../../lib/giraffe/tree/ifTree.rb"
require_relative '../../lib/giraffe/env.rb'
require_relative '../../lib/giraffe/opcodes.rb'
require_relative 'test_utils.rb'
require 'test/unit'

module Giraffe

    class TestIfTree < Test::Unit::TestCase

        def test_run            
            env = Env.new
            dummy_ins = [[DummyTree.new,"ins"]]
            dummy_else = [[DummyTree.new,"ins"]]
            dummy_cond = [DummyTree.new,"cond"]
            dummy_AST = DummyAST.new

            tree = IfTree.new(dummy_cond,dummy_ins,dummy_else)
            return_value, msg = tree.run(env, dummy_AST)

            assert_equal(return_value, nil)
            assert_equal(msg, nil)

            for i in dummy_ins do 
                assert_equal(i[0].executed, true)
                assert_equal(i[0].tree, i[1])
                assert_equal(i[0].env.object_id, env.object_id)
            end
            
            for i in dummy_else do 
                assert_equal(i[0].executed, true)
                assert_equal(i[0].tree, i[1])
                assert_equal(i[0].env.object_id, env.object_id)
            end

            assert_equal(dummy_cond[0].executed, true)
            assert_equal(dummy_cond[0].tree, dummy_cond[1])
            assert_equal(dummy_cond[0].env.object_id, env.object_id)
            
            env.codegen.seal_function

            assert_equal(env.codegen.bytecode[4].value, Opcodes::JNEQ)
            assert_equal(env.codegen.bytecode[5].value, 0)
            assert_equal(env.codegen.bytecode[6].value, 0)
            assert_equal(env.codegen.bytecode[7].value, 0)
            assert_equal(env.codegen.bytecode[8].value, 14)
            assert_equal(env.codegen.bytecode[9].value, Opcodes::JMP)
            assert_equal(env.codegen.bytecode[10].value, 0)
            assert_equal(env.codegen.bytecode[11].value, 0)
            assert_equal(env.codegen.bytecode[12].value, 0)
            assert_equal(env.codegen.bytecode[13].value, 14)

            dummy = [DummyTree.new(true), "ast"]
            tree = IfTree.new(dummy_cond,[dummy],dummy_else)
            return_value, msg = tree.run(env, dummy_AST)

            assert_equal(return_value, "err")
            assert_equal(msg, :error)

            tree = IfTree.new(dummy_cond,dummy_ins,[dummy])
            return_value, msg = tree.run(env, dummy_AST)

            assert_equal(return_value, "err")
            assert_equal(msg, :error)

            tree = IfTree.new(dummy,dummy_ins,dummy_else)
            return_value, msg = tree.run(env, dummy_AST)

            assert_equal(return_value, "err")
            assert_equal(msg, :error)
     
        end

    end
end




