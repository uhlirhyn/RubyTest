# encoding: utf-8

require_relative "../../lib/giraffe/tree/atomTree.rb"
require_relative '../../lib/giraffe/env.rb'
require_relative '../../lib/giraffe/opcodes.rb'
require_relative 'test_utils.rb'
require 'test/unit'

module Giraffe

    class TestAtomTree < Test::Unit::TestCase

        def test_run            
            env = Env.new
            dummy_AST = DummyAST.new

            tree = AtomTree.new(0x12345678)
            return_value, msg = tree.run(env, dummy_AST)

            assert_equal(return_value, nil)
            assert_equal(msg, nil)

            env.codegen.seal_function

            assert_equal(env.codegen.bytecode[4].value, Opcodes::PUSH)
            assert_equal(env.codegen.bytecode[5].value, Opcodes::INTEGER)
            assert_equal(env.codegen.bytecode[6].value,0x12)
            assert_equal(env.codegen.bytecode[7].value,0x34)
            assert_equal(env.codegen.bytecode[8].value,0x56)
            assert_equal(env.codegen.bytecode[9].value,0x78)

        end

    end
end




