require_relative "../../lib/minimal/reader.rb"
require_relative "../../lib/minimal/printer.rb"
require_relative "../../lib/minimal/runner.rb"
require 'test/unit'

module Minimal

    class Reader

        def gets
            @@file.readline
        end

        def self.file=(file)
            @@file = File.new(file,"r")
        end

        def puts(text)
            # silence ...
        end

    end

    class Printer

        def print(t="")
            r = @@file.readline
            @@assert.call(t,r)
        end

        def self.file=(file)
            @@file = File.new(file,"r")
        end

        def self.file
            @@file
        end

        def self.assert=(assert)
            @@assert=assert
        end

    end

    class TestRunner < Test::Unit::TestCase

        def test_file1
            Reader.file = "test/minimal/test_file"
            Printer.file = "test/minimal/out_test"        
            Printer.assert = self.method(:assert_equal)

            r = Runner.new
            r.run        

            # check file end - otherwise, there are results
            # which wasn't printed
            assert_raises EOFError do
                Printer.file.readline
            end

        end
                
    end

end
