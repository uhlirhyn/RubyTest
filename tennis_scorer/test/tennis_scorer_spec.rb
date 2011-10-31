require_relative "../lib/tennis_scorer"
require "rspec"
describe "TennisScorer", "basic scoring" do

	it "should start with a score of 0-0" do
		ts = TennisScorer.new
		ts.score.should == "0-0"
	end
	it "should be 15-0 if the server wins a point" do
		ts = TennisScorer.new
		ts.ser_p
		ts.score.should == "15-0"
	end
	it "should be 30-0 if the server wins a point twice" do
		ts = TennisScorer.new
		ts.ser_p
		ts.ser_p
		ts.score.should == "30-0"
	end
	it "should be 40-0 if the server wins a point 3 times" do
		ts = TennisScorer.new
		ts.ser_p
		ts.ser_p
		ts.ser_p
		ts.score.should == "40-0"
	end
	it "should be 0-0 if the server wins a point 4 times" do
		ts = TennisScorer.new
		ts.ser_p
		ts.ser_p
		ts.ser_p
		ts.ser_p
		ts.score.should == "0-0"
	end

	it "should be 0-15 if the receiver wins a point" do 
		ts = TennisScorer.new
		ts.rec_p
		ts.score.should == "0-15"
	end
	it "should be 15-15 after they both win a point" do
		ts = TennisScorer.new
		ts.ser_p
		ts.rec_p
		ts.score.should == "15-15"
	end
	it "should be 30-15 if the server wins a point twice and one loses" do
		ts = TennisScorer.new
		ts.ser_p
		ts.ser_p
		ts.rec_p
		ts.score.should == "30-15"
	end
	it "should be 40-15 if the server wins a point 3 times and one loses" do
		ts = TennisScorer.new
		ts.ser_p
		ts.ser_p
		ts.rec_p
		ts.ser_p
		ts.score.should == "40-15"
	end
	it "should be 0-0 if the server wins a point 4 times and one loses" do
		ts = TennisScorer.new
		ts.ser_p
		ts.ser_p
		ts.ser_p
		ts.rec_p
		ts.ser_p
		ts.score.should == "0-0"
	end


	it "should be 0-30 if the receiver wins a point twice" do 
		ts = TennisScorer.new
		ts.rec_p
		ts.rec_p
		ts.score.should == "0-30"
	end
	it "should be 15-30 if the server wins a point a 2 loses" do
		ts = TennisScorer.new
		ts.ser_p
		ts.rec_p
		ts.rec_p
		ts.score.should == "15-30"
	end
	it "should be 30-30 if the server wins a point twice and 2 loses" do
		ts = TennisScorer.new
		ts.ser_p
		ts.rec_p
		ts.rec_p
		ts.ser_p
		ts.score.should == "30-30"
	end
	it "should be 40-30 if the server wins a point 3 times and 2 loses" do
		ts = TennisScorer.new
		ts.ser_p
		ts.ser_p
		ts.ser_p
		ts.rec_p
		ts.rec_p
		ts.score.should == "40-30"
	end
	it "should be 0-0 if the server wins a point 4 times and 2 loses" do
		ts = TennisScorer.new
		ts.ser_p
		ts.ser_p
		ts.ser_p
		ts.rec_p
		ts.rec_p
		ts.ser_p
		ts.score.should == "0-0"
	end


	it "should be 0-40 if the receiver wins a point 3 times" do 
		ts = TennisScorer.new
		ts.rec_p
		ts.rec_p
		ts.rec_p
		ts.score.should == "0-40"
	end
	it "should be 15-40 if the server wins a point and 3 loses" do 
		ts = TennisScorer.new
		ts.ser_p
		ts.rec_p
		ts.rec_p
		ts.rec_p
		ts.score.should == "15-40"
	end
	it "should be 30-40 if the server wins 2 points and 3 loses" do 
		ts = TennisScorer.new
		ts.ser_p
		ts.ser_p
		ts.rec_p
		ts.rec_p
		ts.rec_p
		ts.score.should == "30-40"
	end
	it "should be 40-40 if the server wins 3 points and 3 loses" do 
		ts = TennisScorer.new
		ts.ser_p
		ts.ser_p
		ts.ser_p
		ts.rec_p
		ts.rec_p
		ts.rec_p
		ts.score.should == "40-40"
	end
	it "should be 0-0 if the server wins 4 points and 3 loses" do 
		ts = TennisScorer.new
		ts.ser_p
		ts.ser_p
		ts.ser_p
		ts.rec_p
		ts.rec_p
		ts.rec_p
		ts.ser_p
		ts.score.should == "0-0"
	end

	it "should be 0-0 if the receiver wins a point 4 times" do 
		ts = TennisScorer.new
		ts.rec_p
		ts.rec_p
		ts.rec_p
		ts.rec_p
		ts.score.should == "0-0"
	end
	it "should be 0-0 if the server wins a point and 4 loses" do 
		ts = TennisScorer.new
		ts.ser_p
		ts.rec_p
		ts.rec_p
		ts.rec_p
		ts.rec_p
		ts.score.should == "0-0"
	end
	it "should be 0-0 if the server wins 2 points and 4 loses" do 
		ts = TennisScorer.new
		ts.ser_p
		ts.ser_p
		ts.rec_p
		ts.rec_p
		ts.rec_p
		ts.rec_p
		ts.score.should == "0-0"
	end
	it "should be 0-0 if the server wins 3 points and 4 loses" do 
		ts = TennisScorer.new
		ts.ser_p
		ts.ser_p
		ts.ser_p
		ts.rec_p
		ts.rec_p
		ts.rec_p
		ts.rec_p
		ts.score.should == "0-0"
	end
end
