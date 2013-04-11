class Dream < ActiveRecord::Base
  belongs_to :user
  has_and_belongs_to_many :trends

  after_create :add_to_trends
  attr_accessible :title, :body, :dream_date

  def self.dreams_and_trends_from_date(date)
    dreams = Dream.where("dream_date >= ?", date)
    return nil if dreams.nil?

    all_trends = dreams.map { |d| d.trends }.flatten.compact
    trend_hash = Hash.new(0)
    all_trends.each do |trend|
      trend_hash[trend] += 1
    end
    [dreams, trend_hash.sort_by { |k,v| v }.reverse]
  end

  def add_to_trends
    all_words = body.split(/\W+/).map(&:downcase).uniq.each  do |word|
      trend = Trend.find_or_create_by_word(word)
      trend.dreams << self unless trend.excluded?
    end
  end
end
