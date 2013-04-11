class CreateDreams < ActiveRecord::Migration
  def change
    create_table :dreams do |t|
      t.string :title
      t.text :body
      t.integer :user_id
      t.datetime :dream_date
      t.timestamps
    end
  end
end
