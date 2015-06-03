class Tweets < ActiveRecord::Migration
  def change
    create_table :tweets do |t|
      t.string :remote_id
      t.timestamps null: false
      t.index :remote_id
    end
  end
end
