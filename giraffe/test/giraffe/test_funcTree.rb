# encoding: utf-8

require_relative "../../lib/giraffe/tree/funcTree.rb"
require_relative '../../lib/giraffe/env.rb'
require_relative '../../lib/giraffe/opcodes.rb'
require_relative 'test_utils.rb'
require 'test/unit'

module Giraffe

    class TestFuncTree < Test::Unit::TestCase

        def test_run            
            env = Env.new
            dummy_ins = [[DummyTree.new,"ins"]]
            dummy_ins[0][0].set_return = true
            params = ["a","b","c"]
            dummy_AST = DummyAST.new

            tree = FuncTree.new("fce1",params,dummy_ins)
            return_value, msg = tree.run(env, dummy_AST)

            assert_equal(return_value, nil)
            assert_equal(msg, nil)

            for i in dummy_ins do 
                assert_equal(i[0].executed, true)
                assert_equal(i[0].tree, i[1])
            end

            dummy = [DummyTree.new(true), "ast"]
            tree = FuncTree.new("fce1",params,[dummy])
            return_value, msg = tree.run(env, dummy_AST)

            assert_equal(return_value, "err")
            assert_equal(msg, :error)
        end

    end
end




