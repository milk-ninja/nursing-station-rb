class CreatePlaces < ActiveRecord::Migration
  def change
    create_table :places do |t|
      t.string :name
      t.string :address
      t.string :description
      t.float :lat
      t.float :long

      t.timestamps null: false
    end
  end
end
