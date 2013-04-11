class CreateTrends < ActiveRecord::Migration
  create_table :trends do |t|
    t.string :word
    t.boolean :excluded, default: false, null: false
    t.timestamps
  end
end
