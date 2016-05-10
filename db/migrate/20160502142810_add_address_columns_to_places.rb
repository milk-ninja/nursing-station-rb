class AddAddressColumnsToPlaces < ActiveRecord::Migration
  def change
    add_column :places, :street, :string
    add_column :places, :state, :string
    add_column :places, :zip, :integer
  end
end
