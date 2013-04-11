require 'spec_helper'

describe Trend do
  let(:dream) { FactoryGirl.create(:dream)}
  let(:trend) { FactoryGirl.create(:trend) }

  it "should be valid" do
    trend.should be_valid
  end

  describe "when marked excluded" do
    it "removes it from all dreams" do
      dream.trends << trend
      dream.reload

      dream.trends.count.should == 4
      trend.excluded = true
      trend.save
      dream.reload

      dream.trends.count.should == 3
    end
  end
end