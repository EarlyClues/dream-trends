class Dream < ActiveRecord::Base
  belongs_to :user
  has_and_belongs_to_many :trends

  after_create :add_to_trends

  def add_to_trends
    all_words = body.split(/\W+/).map(&:downcase).uniq.each  do |word|
      trend = Trend.find_or_create_by_word(word)
      trend.dreams << self unless trend.excluded?
    end
  end
end
