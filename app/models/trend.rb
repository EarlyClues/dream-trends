class Trend < ActiveRecord::Base
  has_and_belongs_to_many :dreams

  validates :word, uniqueness: true

  before_save :remove_from_dreams_if_excluded
  attr_accessible :excluded

  def remove_from_dreams_if_excluded
    if excluded
      self.dreams.delete_all
    end
  end

  def dreams_in_range(start_date, end_date)
    dreams.where("dream_date >= ? AND dream_date <= ?", start_date, end_date)
  end
end
