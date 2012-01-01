# encoding: utf-8

require_relative "../../lib/giraffe/tree/arrayTree.rb"
require_relative '../../lib/giraffe/env.rb'
require_relative '../../lib/giraffe/opcodes.rb'
require_relative 'test_utils.rb'
require 'test/unit'

module Giraffe

    class TestArrayTree < Test::Unit::TestCase

        def test_run            
            env = Env.new
            dummy_AST = DummyAST.new
            
            dummy1 = [DummyTree.new, "ast1"]
            dummy2 = [DummyTree.new, "ast2"]
            dummy3 = [DummyTree.new, "ast3"]
            
            elements = [dummy1, dummy2, dummy3]

            tree = ArrayTree.new(elements)
            return_value, msg = tree.run(env, dummy_AST)

            assert_equal(return_value, nil)
            assert_equal(msg, nil)

            for dummy in elements do
                assert_equal(dummy[0].executed, true)
                assert_equal(dummy[0].tree, dummy[1])
                assert_equal(dummy[0].env.object_id, env.object_id)
            end
            
            env.codegen.seal_function

            assert_equal(env.codegen.bytecode[4].value, Opcodes::ALLOC)
            assert_equal(env.codegen.bytecode[5].value, 0)
            assert_equal(env.codegen.bytecode[6].value, 0)
            assert_equal(env.codegen.bytecode[7].value, 0)
            assert_equal(env.codegen.bytecode[8].value, 3)

            dummy = DummyTree.new(true)
            tree = ArrayTree.new([[dummy,"ast"]])
            return_value, msg = tree.run(env, dummy_AST)

            assert_equal(return_value, "err")
            assert_equal(msg, :error)

        end

    end
end




