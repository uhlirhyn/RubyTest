require_relative "../../lib/giraffe/codegen_vals.rb"
require 'test/unit'

module Giraffe

    class TestEnvVals < Test::Unit::TestCase

        def test_hook
            
            label = "label1"
            hooks = {}
            hooks[label] = 0x12345678

            hook_0 = Hook.new(label, hooks, 0)
            hook_1 = Hook.new(label, hooks, 1)
            hook_2 = Hook.new(label, hooks, 2)
            hook_3 = Hook.new(label, hooks, 3)
            
            assert_equal(hook_0.value, 0x78)
            assert_equal(hook_1.value, 0x56)
            assert_equal(hook_2.value, 0x34)
            assert_equal(hook_3.value, 0x12)

        end
    end
end
