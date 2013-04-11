class CreateDreamsTrends < ActiveRecord::Migration
  def change
    create_table :dreams_trends do |t|
      t.integer :dream_id
      t.integer :trend_id
    end
  end
end
