class Dream < ActiveRecord::Base
  belongs_to :user
  has_and_belongs_to_many :trends

  after_create :add_to_trends
  attr_accessible :title, :body, :dream_date

  def self.trends_between_dates(start_date, end_date=Time.now.beginning_of_day)
    dreams = Dream.dreams_in_range(start_date, end_date)
    return [] if dreams.empty?

    all_trends = dreams.map { |d| d.trends }.flatten.compact
    trend_hash = Hash.new(0)
    all_trends.each do |trend|
      trend_hash[trend] += 1
    end
    trend_hash.sort_by { |k,v| v }.reverse
  end

  def self.dreams_in_range(start_date, end_date)
    Dream.where("dream_date >= ? AND dream_date <= ?", start_date, end_date)
  end

  def add_to_trends
    all_words = body.split(/\W+/).map(&:downcase).uniq.each  do |word|
      trend = Trend.find_or_create_by_word(word)
      trend.dreams << self unless trend.excluded?
    end
  end
end
