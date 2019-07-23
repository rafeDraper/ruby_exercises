require 'minitest/autorun'
require_relative 'substrings'

class Substringstest < Minitest::Test
    

    def test_basic
        dictionary = ["below","down","go","going","horn","how","howdy","it","i","low","own","part","partner","sit"]
        assert_equal ({ "below" => 1, "low" => 1 }), Excercise.count_string("below", dictionary)
    end

    def test_complete_word
        dictionary = ["below","down","go","going","horn","how","howdy","it","i","low","own","part","partner","sit"]
        assert_equal ({ "down" => 1, "how" => 2, "howdy" => 1,"go" => 1, "going" => 1, "it" => 2, "i" => 3, "own" => 1,"part" => 1,"partner" => 1,"sit" => 1 }), Excercise.count_string("Howdy partner, sit down! How's it going?", dictionary)
    end

end
