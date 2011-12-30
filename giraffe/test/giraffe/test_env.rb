# encoding: utf-8

require_relative "../../lib/giraffe/env.rb"
require_relative '../../lib/giraffe/opcodes.rb'
require 'test/unit'

module Giraffe

    class TestEnv < Test::Unit::TestCase

        def test_return 

            # jednoducha funkce
            env = Env.new
            # bez return
            assert_equal(env.is_return?, nil)

            # return nalezen
            env.return_found
            assert_equal(env.is_return?, true)

            # jednoduchy if
            # if - bez return 
            # bez else
            env = Env.new
            env.return_branch_if
            assert_equal(env.is_return?, nil)
            env.return_rise
            assert_equal(env.is_return?, nil)
            
            # jednoduchy if
            # if - bez return 
            # else - bez return
            env = Env.new
            env.return_branch_if
            assert_equal(env.is_return?, nil)
            env.return_branch_else
            assert_equal(env.is_return?, nil)
            env.return_rise
            assert_equal(env.is_return?, nil)
      
            # jednoduchy if
            # if - s return 
            # bez else
            env = Env.new
            env.return_branch_if
            env.return_found
            assert_equal(env.is_return?, nil)
            env.return_rise
            assert_equal(env.is_return?, nil)
                  
            # jednoduchy if
            # if - s return 
            # else - bez return
            env = Env.new
            env.return_branch_if
            env.return_found
            assert_equal(env.is_return?, nil)
            env.return_branch_else
            assert_equal(env.is_return?, nil)
            env.return_rise
            assert_equal(env.is_return?, nil)
 
            # jednoduchy if
            # if - bez return 
            # else - s return
            env = Env.new
            env.return_branch_if
            assert_equal(env.is_return?, nil)
            env.return_branch_else
            env.return_found
            assert_equal(env.is_return?, nil)
            env.return_rise
            assert_equal(env.is_return?, nil)
            
            # jednoduchy if
            # if - s return 
            # else - s return
            env = Env.new
            env.return_branch_if
            env.return_found
            assert_equal(env.is_return?, nil)
            env.return_branch_else
            env.return_found
            assert_equal(env.is_return?, nil)   
            env.return_rise # az zde se to uzavre na true
            assert_equal(env.is_return?, true)

            # vnoreny if v casti if
            # vnoreni nema return
            # if nema return
            # else nema return
            env = Env.new
            env.return_branch_if
            env.return_branch_if
            env.return_rise
            env.return_branch_else
            env.return_rise
            assert_equal(env.is_return?, nil)

            # vnoreny if v casti if
            # vnoreni nema return
            # if nema return
            # else ma return
            env = Env.new
            env.return_branch_if
            env.return_branch_if
            env.return_rise
            env.return_branch_else
            env.return_found
            env.return_rise
            assert_equal(env.is_return?, nil)

            # vnoreny if v casti if
            # vnoreni nema return
            # if ma return
            # else ma return
            env = Env.new
            env.return_branch_if
            env.return_found
            env.return_branch_if
            env.return_rise
            env.return_branch_else
            env.return_found
            env.return_rise
            assert_equal(env.is_return?, true)

            # vnoreny if v casti if
            # vnoreni ma return v if
            # if nema return
            # else ma return
            env = Env.new
            env.return_branch_if
            env.return_branch_if
            env.return_found
            env.return_rise
            env.return_branch_else
            env.return_found
            env.return_rise
            assert_equal(env.is_return?, nil)

            # vnoreny if v casti if
            # vnoreni ma return v else
            # if nema return
            # else ma return
            env = Env.new
            env.return_branch_if
            env.return_branch_if
            env.return_branch_else
            env.return_found
            env.return_rise
            env.return_branch_else
            env.return_found
            env.return_rise
            assert_equal(env.is_return?, nil)

            # vnoreny if v casti if
            # vnoreni ma return v else i v if
            # if nema return
            # else ma return
            env = Env.new
            env.return_branch_if
            env.return_branch_if
            env.return_found
            env.return_branch_else
            env.return_found
            env.return_rise
            env.return_branch_else
            env.return_found
            env.return_rise
            assert_equal(env.is_return?, true)

        end
  
        def test_var_declare
            env = Env.new
            cdg = env.codegen
            current_byte = cdg.current_byte 

            env.var!("a")           
            assert_equal(cdg.locals, 1)
            assert_equal(cdg.current_byte, current_byte + 5)

            env.var!("b")           
            assert_equal(cdg.locals, 2)
            assert_equal(cdg.current_byte, current_byte + 10)
            
            cdg.seal_function

            assert_equal(cdg.bytecode[4].value,Opcodes::PUSH)
            assert_equal(cdg.bytecode[5].value,Opcodes::INTEGER)
            assert_equal(cdg.bytecode[6].value,0)
            assert_equal(cdg.bytecode[7].value,0)
            assert_equal(cdg.bytecode[8].value,0)
            assert_equal(cdg.bytecode[9].value,0)
            assert_equal(cdg.bytecode[10].value,Opcodes::PUSH)
            assert_equal(cdg.bytecode[11].value,Opcodes::INTEGER)
            assert_equal(cdg.bytecode[12].value,0)
            assert_equal(cdg.bytecode[13].value,0)
            assert_equal(cdg.bytecode[14].value,0)
            assert_equal(cdg.bytecode[15].value,0)
            assert_equal(cdg.bytecode[16].value,Opcodes::PSL)
            assert_equal(cdg.bytecode[17].value,0)
            assert_equal(cdg.bytecode[18].value,0)
            assert_equal(cdg.bytecode[19].value,0)
            assert_equal(cdg.bytecode[20].value,0)
            assert_equal(cdg.bytecode[21].value,Opcodes::PSL)
            assert_equal(cdg.bytecode[22].value,0)
            assert_equal(cdg.bytecode[23].value,0)
            assert_equal(cdg.bytecode[24].value,0)
            assert_equal(cdg.bytecode[25].value,1)
        end

        def test_var_use
            env = Env.new
            cdg = env.codegen
            current_byte = cdg.current_byte 

            env.var!("a")           
            assert_equal(cdg.locals, 1)
            assert_equal(cdg.current_byte, current_byte + 5)

            env.var!("a")           
            assert_equal(cdg.locals, 1)
            assert_equal(cdg.current_byte, current_byte + 10)
            
            cdg.seal_function

            assert_equal(cdg.bytecode[4].value,Opcodes::PUSH)
            assert_equal(cdg.bytecode[5].value,Opcodes::INTEGER)
            assert_equal(cdg.bytecode[6].value,0)
            assert_equal(cdg.bytecode[7].value,0)
            assert_equal(cdg.bytecode[8].value,0)
            assert_equal(cdg.bytecode[9].value,0)
            assert_equal(cdg.bytecode[10].value,Opcodes::PSL)
            assert_equal(cdg.bytecode[11].value,0)
            assert_equal(cdg.bytecode[12].value,0)
            assert_equal(cdg.bytecode[13].value,0)
            assert_equal(cdg.bytecode[14].value,0)
            assert_equal(cdg.bytecode[15].value,Opcodes::PSL)
            assert_equal(cdg.bytecode[16].value,0)
            assert_equal(cdg.bytecode[17].value,0)
            assert_equal(cdg.bytecode[18].value,0)
            assert_equal(cdg.bytecode[19].value,0)
        end

        def test_var_call
            env = Env.new
            cdg = env.codegen
            current_byte = cdg.current_byte 

            env.var!("a")           
            assert_equal(cdg.locals, 1)
            assert_equal(cdg.current_byte, current_byte + 5)
           
            return_value, msg = env.var("a")
            assert_equal(msg, nil)
            assert_equal(cdg.locals, 1)
            assert_equal(cdg.current_byte, current_byte + 10)

            return_value, msg = env.var("b")
            assert_equal(msg, :error)

            assert_equal(cdg.locals, 1)
            assert_equal(cdg.current_byte, current_byte + 10)
            
            cdg.seal_function

            assert_equal(cdg.bytecode[4].value,Opcodes::PUSH)
            assert_equal(cdg.bytecode[5].value,Opcodes::INTEGER)
            assert_equal(cdg.bytecode[6].value,0)
            assert_equal(cdg.bytecode[7].value,0)
            assert_equal(cdg.bytecode[8].value,0)
            assert_equal(cdg.bytecode[9].value,0)
            assert_equal(cdg.bytecode[10].value,Opcodes::PSL)
            assert_equal(cdg.bytecode[11].value,0)
            assert_equal(cdg.bytecode[12].value,0)
            assert_equal(cdg.bytecode[13].value,0)
            assert_equal(cdg.bytecode[14].value,0)
        end

        def test_func
            env = Env.new
            cdg = env.codegen
            
            env.func!("fce1",["a","b","c"])

            return_value, msg = env.func!("fce1",["a","b","c"])
            assert_equal(msg, :error)

            return_value, msg = env.func("fce1",[4,5])
            assert_equal(msg, :error)

            return_value, msg = env.func("fce2",[4,5])
            assert_equal(msg, :error)
            
            return_value, msg = env.func("fce1",[4,5,6])
            assert_equal(msg, nil)

            # CALL + 4B address + 3x POP args + RER
            assert_equal(cdg.current_byte, 4 + 5 + 3 + 1)

            cdg.seal_function

            assert_equal(cdg.bytecode[4].value,Opcodes::CALL)
            assert_equal(cdg.bytecode[5].value,0)
            assert_equal(cdg.bytecode[6].value,0)
            assert_equal(cdg.bytecode[7].value,0)
            assert_equal(cdg.bytecode[8].value,4)
            assert_equal(cdg.bytecode[9].value,Opcodes::POP)
            assert_equal(cdg.bytecode[10].value,Opcodes::POP)
            assert_equal(cdg.bytecode[11].value,Opcodes::POP)
            assert_equal(cdg.bytecode[12].value,Opcodes::RER)

        end

        def test_main
            env = Env.new
            cdg = env.codegen

            env.func!("main",[])
            
            assert_equal(cdg.bytecode[0].value,0)
            assert_equal(cdg.bytecode[1].value,0)
            assert_equal(cdg.bytecode[2].value,0)
            assert_equal(cdg.bytecode[3].value,4)
        end

        def test_params
            env = Env.new
            cdg = env.codegen

            return_value, msg = env.var("a")
            assert_equal(msg, :error)

            env.register_params(["a","b","c"])

            return_value, msg = env.var("a")
            assert_equal(msg, nil)

            cdg.seal_function

            assert_equal(cdg.bytecode[4].value,Opcodes::PAS)
            assert_equal(cdg.bytecode[5].value,0)
            assert_equal(cdg.bytecode[6].value,0)
            assert_equal(cdg.bytecode[7].value,0)
            assert_equal(cdg.bytecode[8].value,2)
        end

    end

end
