require 'test/unit'
require 'lib/anagram/finder'

class TestFinder < Test::Unit::TestCase

	def test_signatures1
		finder = Anagram::Finder.new("test/testDict")
		assert_equal(finder.signatures,{"abc"=>["cab"],"aazz"=>["zaza"]})
	end

	def test_signatures2
		finder = Anagram::Finder.new("test/testDict2")
		assert_equal(finder.signatures,{"abc"=>["cab","bac"],"aazz"=>["zaza"],"aarry"=>["aryra"]})
	end

	def test_default_dict
		finder = Anagram::Finder.new(nil)
		assert_equal(finder.dictionary,"bin/dict")
	end
	
	def test_default_dict2
		finder = Anagram::Finder.new("test/testDict")
		assert_equal(finder.dictionary,"test/testDict")
	end

end
