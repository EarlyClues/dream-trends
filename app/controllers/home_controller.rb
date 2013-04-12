class HomeController < ApplicationController

  def index
    @last_week = Time.now.beginning_of_day - 7.day
    @top_trends = Dream.trends_between_dates(@last_week)
  end
end