class CreateRatings < ActiveRecord::Migration
  def change
    create_table :ratings do |t|
      t.integer :user_id
      t.integer :place_id
      t.text :comment
      t.integer :privacy
      t.integer :cleanliness

      t.timestamps null: false
    end
  end
end
