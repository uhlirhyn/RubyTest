# encoding: utf-8

require_relative "../../lib/giraffe/tree/forTree.rb"
require_relative '../../lib/giraffe/env.rb'
require_relative '../../lib/giraffe/opcodes.rb'
require_relative 'test_utils.rb'
require 'test/unit'

module Giraffe

    class TestForTree < Test::Unit::TestCase

        def test_run            
            env = Env.new
            dummy_ins = [[DummyTree.new,"ins"]]
            dummy_cond = [DummyTree.new,"cond"]
            dummy_asgn1 = [DummyTree.new,"asgn1"]
            dummy_asgn2 = [DummyTree.new,"asgn2"]
            dummy_AST = DummyAST.new

            tree = ForTree.new(dummy_asgn1,dummy_cond,dummy_asgn2,dummy_ins)
            return_value, msg = tree.run(env, dummy_AST)

            assert_equal(return_value, nil)
            assert_equal(msg, nil)

            for i in dummy_ins do 
                assert_equal(i[0].executed, true)
                assert_equal(i[0].tree, i[1])
                assert_equal(i[0].env.object_id, env.object_id)
            end

            assert_equal(dummy_cond[0].executed, true)
            assert_equal(dummy_cond[0].tree, dummy_cond[1])
            assert_equal(dummy_cond[0].env.object_id, env.object_id)
            assert_equal(dummy_asgn1[0].executed, true)
            assert_equal(dummy_asgn1[0].tree, dummy_asgn1[1])
            assert_equal(dummy_asgn1[0].env.object_id, env.object_id)
            assert_equal(dummy_asgn2[0].executed, true)
            assert_equal(dummy_asgn2[0].tree, dummy_asgn2[1])
            assert_equal(dummy_asgn2[0].env.object_id, env.object_id)
            
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
            assert_equal(env.codegen.bytecode[13].value, 4)

            dummy = [DummyTree.new(true), "ast"]
            tree = ForTree.new(dummy,dummy_cond,dummy_asgn2,dummy_ins)
            return_value, msg = tree.run(env, dummy_AST)

            assert_equal(return_value, "err")
            assert_equal(msg, :error)

            tree = ForTree.new(dummy_asgn1,dummy,dummy_asgn2,dummy_ins)
            return_value, msg = tree.run(env, dummy_AST)

            assert_equal(return_value, "err")
            assert_equal(msg, :error)
            
            tree = ForTree.new(dummy_asgn1,dummy_cond,dummy,dummy_ins)
            return_value, msg = tree.run(env, dummy_AST)

            assert_equal(return_value, "err")
            assert_equal(msg, :error)
        end

    end
end




