# encoding: utf-8

require_relative "../../lib/giraffe/codegen.rb"
require_relative "../../lib/giraffe/codegen_vals.rb"
require 'test/unit'

module Giraffe

    class TestCodegen < Test::Unit::TestCase

        def test_write_opcode
            cdg = Codegen.new
            cdg.write_opcode(0x13)
            cdg.seal_function
            assert_equal(cdg.bytecode[4].value,0x13)
        end

        def test_write_nil
            cdg = Codegen.new
            cdg.write_nil
            cdg.seal_function
            assert_equal(cdg.bytecode[4].value,Opcodes::NULL)
            assert_equal(cdg.bytecode[5].value,0x00)
            assert_equal(cdg.bytecode[6].value,0x00)
            assert_equal(cdg.bytecode[7].value,0x00)
            assert_equal(cdg.bytecode[8].value,0x00)
        end

        def test_write_4B
            cdg = Codegen.new
            cdg.write_4B(0x12345678)
            cdg.seal_function
            assert_equal(cdg.bytecode[4].value,0x12)
            assert_equal(cdg.bytecode[5].value,0x34)
            assert_equal(cdg.bytecode[6].value,0x56)
            assert_equal(cdg.bytecode[7].value,0x78)
        end

        def test_write_character
            cdg = Codegen.new
            cdg.write_character('”')
            cdg.seal_function
            assert_equal(cdg.bytecode[4].value,Opcodes::CHARACTER)
            assert_equal(cdg.bytecode[5].value,0)
            assert_equal(cdg.bytecode[6].value,226)
            assert_equal(cdg.bytecode[7].value,128)
            assert_equal(cdg.bytecode[8].value,157)
        end

        def test_write_main
            cdg = Codegen.new
            cdg.write_main(0x12345678)
            assert_equal(cdg.bytecode[0].value,0x12)
            assert_equal(cdg.bytecode[1].value,0x34)
            assert_equal(cdg.bytecode[2].value,0x56)
            assert_equal(cdg.bytecode[3].value,0x78)
        end

        def test_write_int
            cdg = Codegen.new
            cdg.write_int(305419896)
            cdg.seal_function
            assert_equal(cdg.bytecode[4].value,Opcodes::INTEGER)
            assert_equal(cdg.bytecode[5].value,0x12)
            assert_equal(cdg.bytecode[6].value,0x34)
            assert_equal(cdg.bytecode[7].value,0x56)
            assert_equal(cdg.bytecode[8].value,0x78)
        end

        def test_write_s_pointer
            cdg = Codegen.new
            cdg.write_s_pointer(305419896)
            cdg.seal_function
            assert_equal(cdg.bytecode[4].value,Opcodes::S_POINTER)
            assert_equal(cdg.bytecode[5].value,0x12)
            assert_equal(cdg.bytecode[6].value,0x34)
            assert_equal(cdg.bytecode[7].value,0x56)
            assert_equal(cdg.bytecode[8].value,0x78)
        end

        def test_write_pointer
            cdg = Codegen.new
            cdg.write_pointer(305419896)
            cdg.seal_function
            assert_equal(cdg.bytecode[4].value,Opcodes::POINTER)
            assert_equal(cdg.bytecode[5].value,0x12)
            assert_equal(cdg.bytecode[6].value,0x34)
            assert_equal(cdg.bytecode[7].value,0x56)
            assert_equal(cdg.bytecode[8].value,0x78)
        end

        def test_write_bool
            cdg = Codegen.new
            cdg.write_bool(305419896)
            cdg.seal_function
            assert_equal(cdg.bytecode[4].value,Opcodes::BOOLEAN)
            assert_equal(cdg.bytecode[5].value,0x12)
            assert_equal(cdg.bytecode[6].value,0x34)
            assert_equal(cdg.bytecode[7].value,0x56)
            assert_equal(cdg.bytecode[8].value,0x78)
        end

        def test_next_label
            cdg = Codegen.new
            assert_equal(cdg.next_label,0)
            assert_equal(cdg.next_label,1)
            assert_equal(cdg.next_label,2)
            cdg = Codegen.new
            assert_equal(cdg.next_label,0)
        end

        def test_hooks
            cdg = Codegen.new
            label = cdg.next_label
            cdg.insert_hook(label)
            assert_equal(cdg.current_byte,8)
            cdg.insert_anchor(label)
            cdg.seal_function
            assert_equal(cdg.bytecode[4].value,0)
            assert_equal(cdg.bytecode[5].value,0)
            assert_equal(cdg.bytecode[6].value,0)
            assert_equal(cdg.bytecode[7].value,8)
        end

        def test_hooks2
            cdg = Codegen.new
            label = cdg.next_label
            cdg.insert_anchor(label)
            cdg.insert_hook(label)
            assert_equal(cdg.current_byte,8)
            cdg.seal_function
            assert_equal(cdg.bytecode[4].value,0)
            assert_equal(cdg.bytecode[5].value,0)
            assert_equal(cdg.bytecode[6].value,0)
            assert_equal(cdg.bytecode[7].value,4)
        end

        def test_generate
            cdg = Codegen.new

            main_add = 0x12345678
            cdg.write_main(main_add)
                
            testfile = "codegen_test_file"
            cdg.generate(testfile)

            bytes = []
            File.open(testfile, "rb") do 
                |f|
                f.each_byte do
                    |b|
                    bytes << b
                end
            end
            assert_equal(bytes,[0x12,0x34,0x56,0x78])
        end
    end
end
