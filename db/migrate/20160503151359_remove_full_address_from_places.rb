class RemoveFullAddressFromPlaces < ActiveRecord::Migration
  def change
    remove_column(:places, :full_address, :string)
  end
end
