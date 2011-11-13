require 'test/unit'

Dir[File.dirname(__FILE__) + '/lib/giraffe/tree/*.rb'].each do
    |file| require file
end

class TestAssignTree < Test::Unit::TestCase

    def test_normal
        assert_equal(AssignTree.new())
    end

end
