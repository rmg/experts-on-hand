class CreateCheckins < ActiveRecord::Migration
  def change
    create_table :checkins do |t|
      t.references :user
      t.datetime :starting_at
      t.datetime :ending_at

      t.timestamps
    end
    add_index :checkins, :user_id
  end
end
