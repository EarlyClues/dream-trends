require 'spec_helper'

describe Dream do

  let(:dream) { FactoryGirl.create(:dream) }
  let(:grasshopper_dream) { FactoryGirl.create(:dream, body: "orange playdoh grasshopper")}
  let(:grasshopper_excluded_trend) { FactoryGirl.create(:trend, word: "grasshopper", excluded: true)}
  it "should be valid" do
    dream.should be_valid
  end

  describe "on save" do
    it "should save off all trends" do
      Trend.all.should == []
      grasshopper_dream

      trends = Trend.all
      trends.count.should == 3
      trends.any? { |t| t.word == "orange" }.should be_true
      trends.any? { |t| t.word == "playdoh" }.should be_true
      trends.any? { |t| t.word == "grasshopper" }.should be_true
      trends.any? { |t| t.word == "bogus" }.should be_false
    end

    it "should not have any trends that have been marked as excluded" do
      grasshopper_excluded_trend
      Trend.all.should == [grasshopper_excluded_trend]
      grasshopper_dream

      trends = Trend.where(excluded: false)
      trends.count.should == 2
      trends.any? { |t| t.word == "orange" }.should be_true
      trends.any? { |t| t.word == "playdoh" }.should be_true
      trends.any? { |t| t.word == "grasshopper" }.should be_false
      trends.any? { |t| t.word == "bogus" }.should be_false
    end
  end
end