require 'spec_helper'

describe Video do

	it "should have a category" do 
		vid = Video.new
		vid.category.save.should be_false
	end

	it "should have a video" do 
		vid = Video.new
		vid.save.should be_false
	end

	it "should display latest 3 videos" do 
		vid = Video.limit(3).order(:created_at)
		Video.home.should == vid

	end


end
