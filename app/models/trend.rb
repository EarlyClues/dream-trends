class Trend < ActiveRecord::Base
  has_and_belongs_to_many :dreams

  validates :word, uniqueness: true

  before_save :remove_from_dreams_if_excluded

  def remove_from_dreams_if_excluded
    if excluded
      self.dreams.delete_all
    end
  end
end
