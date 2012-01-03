# encoding: utf-8

require_relative "../../lib/giraffe/tree/unaryOperatorTree.rb"
require_relative '../../lib/giraffe/env.rb'
require_relative '../../lib/giraffe/opcodes.rb'
require_relative 'test_utils.rb'
require 'test/unit'

module Giraffe

    class TestUnaryOperatorTree < Test::Unit::TestCase

        def operator_method
            :output
        end

        def test_run            
            env = Env.new
            dummy_op1 = [DummyTree.new(false,0x05),"op1"]
            dummy_operator = self.method(:operator_method)
            dummy_AST = DummyAST.new

            tree = UnaryOperatorTree.new(dummy_op1, dummy_operator)
            return_value, msg = tree.run(env, dummy_AST)

            assert_equal(return_value, nil)
            assert_equal(msg, nil)

            assert_equal(dummy_op1[0].executed, true)
            assert_equal(dummy_op1[0].tree, dummy_op1[1])
            assert_equal(dummy_op1[0].env.object_id, env.object_id)
            
            env.codegen.seal_function

            assert_equal(env.codegen.bytecode[4].value, :output)

            dummy = DummyTree.new(true)
            tree = UnaryOperatorTree.new([dummy,"ast"],dummy_operator)
            return_value, msg = tree.run(env, dummy_AST)

            assert_equal(return_value, "err")
            assert_equal(msg, :error)

        end

    end
end




