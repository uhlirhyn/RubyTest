require_relative "../../lib/rectangles/reader.rb"
require 'test/unit'

module Rectangle

    class Reader

        def gets
            @gets_test_data.shift
        end

        def gets=(value)
            @gets_test_data=value
        end

        def print(text)
            # silence ...
        end

    end


    class TestReader < Test::Unit::TestCase

        def test_check_float_ok
            assert_equal(Reader.new.check_float("45"),45)
            assert_equal(Reader.new.check_float(".45"),0.45)
            assert_equal(Reader.new.check_float("45e1"),45e1)
            assert_equal(Reader.new.check_float(".45e1"),0.45e1)
        end

        def test_check_float_fail
            assert_raises SystemExit do
                Reader.new.check_float("sadfasd")
            end
            assert_raises SystemExit do
                Reader.new.check_float("45 2")
            end
            assert_raises SystemExit do
                Reader.new.check_float("")
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

        def test_read

            r = Reader.new
            r.gets=["1.2","2.2","3.2","4.2","5.2", "6.2"]
            r.read
            assert_equal(r.w1,1.2)
            assert_equal(r.x1,2.2)
            assert_equal(r.y1,3.2)
            assert_equal(r.w2,4.2)
            assert_equal(r.x2,5.2)
            assert_equal(r.y2,6.2)

            r.gets=["0","2.2","3.2","0","5.2", "6.2"]
            r.read
            assert_equal(r.w1,0)
            assert_equal(r.w2,0)

        end

        def test_read_fail 
            assert_raises SystemExit do
                r = Reader.new
                r.gets=["-1.2","2.2","3.2","4.2","5.2", "6.2"]
                r.read
            end
            assert_raises SystemExit do
                r = Reader.new
                r.gets=["1.2","2.2","3.2","-4.2","5.2", "6.2"]
                r.read
            end
        end

    end

end
