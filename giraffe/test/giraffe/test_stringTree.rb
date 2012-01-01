# encoding: utf-8

require_relative "../../lib/giraffe/tree/stringTree.rb"
require_relative '../../lib/giraffe/env.rb'
require_relative '../../lib/giraffe/opcodes.rb'
require_relative 'test_utils.rb'
require 'test/unit'

module Giraffe

    class TestStringTree < Test::Unit::TestCase

        def test_run            
            env = Env.new
            text = "ab"
            dummy_AST = DummyAST.new

            tree = StringTree.new(text)
            return_value, msg = tree.run(env, dummy_AST)

            assert_equal(return_value, nil)
            assert_equal(msg, nil)

            env.codegen.seal_function

            assert_equal(env.codegen.bytecode[4].value,Opcodes::PUSH)
            assert_equal(env.codegen.bytecode[5].value,Opcodes::CHARACTER)
            assert_equal(env.codegen.bytecode[6].value,0)
            assert_equal(env.codegen.bytecode[7].value,0)
            assert_equal(env.codegen.bytecode[8].value,0)
            assert_equal(env.codegen.bytecode[9].value,'b'.ord)
            assert_equal(env.codegen.bytecode[10].value,Opcodes::PUSH)
            assert_equal(env.codegen.bytecode[11].value,Opcodes::CHARACTER)
            assert_equal(env.codegen.bytecode[12].value,0)
            assert_equal(env.codegen.bytecode[13].value,0)
            assert_equal(env.codegen.bytecode[14].value,0)
            assert_equal(env.codegen.bytecode[15].value,'a'.ord)
            
            assert_equal(env.codegen.bytecode[16].value,Opcodes::ALLOC)
            assert_equal(env.codegen.bytecode[17].value,0)
            assert_equal(env.codegen.bytecode[18].value,0)
            assert_equal(env.codegen.bytecode[19].value,0)
            assert_equal(env.codegen.bytecode[20].value,2)
            
        end

    end
end




