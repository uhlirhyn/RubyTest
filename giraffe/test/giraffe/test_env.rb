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
  
       
    end

end
