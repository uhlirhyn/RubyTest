# encoding: utf-8

require_relative "../../lib/giraffe/tree/printTree.rb"
require_relative '../../lib/giraffe/env.rb'
require_relative '../../lib/giraffe/opcodes.rb'
require_relative 'test_utils.rb'
require 'test/unit'

module Giraffe

    class TestPrintTree < Test::Unit::TestCase

        def test_run            
            env = Env.new
            dummy_txt = [[DummyTree.new,"txt"]]
            dummy_AST = DummyAST.new

            tree = PrintTree.new(dummy_txt,false)
            return_value, msg = tree.run(env, dummy_AST)

            assert_equal(return_value, nil)
            assert_equal(msg, nil)

            for i in dummy_txt do 
                assert_equal(i[0].executed, true)
                assert_equal(i[0].tree, i[1])
                assert_equal(i[0].env.object_id, env.object_id)
            end

            env.codegen.seal_function

            assert_equal(env.codegen.bytecode[4].value, Opcodes::OUT)

            dummy = DummyTree.new(true)
            tree = PrintTree.new([[dummy,"txt"]],false)
            return_value, msg = tree.run(env, dummy_AST)

            assert_equal(return_value, "err")
            assert_equal(msg, :error)

        end

    end
end




