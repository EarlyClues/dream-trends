class HomeController < ApplicationController

  def index
    yesterday = Time.now.beginning_of_day - 1.day
    @top_trends = Dream.dreams_and_trends_from_date(yesterday)
  end
end