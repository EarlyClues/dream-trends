class HomeController < ApplicationController

  def index
    yesterday = Time.now.beginning_of_day - 2.day
    @top_trends = Dream.trends_from_date(yesterday)
  end
end