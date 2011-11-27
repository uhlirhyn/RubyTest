require_relative "../../lib/minimal/reader.rb"
require 'test/unit'

module Minimal

    class Reader

        def gets
            "#{@gets_test_data.shift}\n"
        end

        def gets=(value)
            @gets_test_data=value
        end

        def puts(text)
            # silence ...
        end

    end


    class TestReader < Test::Unit::TestCase

        def test_check_integer_ok
            assert_equal(Reader.new.check_integer("45"),45)
        end

        def test_check_integer_fail
            assert_raises SystemExit do
                Reader.new.check_integer("45.2")
            end
            assert_raises SystemExit do
                Reader.new.check_integer("sadfasd")
            end
            assert_raises SystemExit do
                Reader.new.check_integer("45 2")
            end
            assert_raises SystemExit do
                Reader.new.check_integer("")
            end
        end

        def test_check_interval_ok
            assert_equal(Reader.new.check_interval(1,0,5),1)
            assert_equal(Reader.new.check_interval(1,nil,5),1)
            assert_equal(Reader.new.check_interval(1,0,nil),1)
            assert_equal(Reader.new.check_interval(1,1,5),1)
            assert_equal(Reader.new.check_interval(1,1,nil),1)
            assert_equal(Reader.new.check_interval(5,nil,5),5)
            assert_equal(Reader.new.check_interval(4,1,5),4)
            assert_equal(Reader.new.check_interval(5,1,5),5)                    
        end

        def test_check_interval_fail
            assert_raises SystemExit do
                Reader.new.check_interval(1,2,5)
            end
            assert_raises SystemExit do
                Reader.new.check_interval(5,1,4)
            end
            assert_raises SystemExit do
                Reader.new.check_interval(1,2,nil)
            end
            assert_raises SystemExit do
                Reader.new.check_interval(5,nil,4)
            end
        end

        def test_read_tests
            r = Reader.new
            r.gets=["0"]
            assert_equal(r.read_tests,[])
            r.gets=["1","","5","4 1","0 0"]
            assert_equal(r.read_tests,[[[0,5],[1,4]]])
            r.gets=["1","","5","4 1","3 2","0 0"]
            assert_equal(r.read_tests,[[[0,5],[1,4],[2,3]]])
            r.gets=["2","","5","4 1","3 2","0 0","","2","1 2","0 0"]
            assert_equal(r.read_tests,[[[0,5],[1,4],[2,3]],[[0,2],[1,2]]])
        end

        def test_read_tests_fail
            assert_raises SystemExit do
                r = Reader.new
                r.gets=["2.0","5","4 1","3 2","0 0"]
                r.read_tests
            end
            assert_raises SystemExit do
                r = Reader.new
                r.gets=["2","5","4 1","3 2","0 0"]
                r.read_tests
            end
            assert_raises SystemExit do
                r = Reader.new
                r.gets=["2","","5","4 1","3 2","0 0","2","1 2","0 0"]
                r.read_tests
            end
        end

    end

end
