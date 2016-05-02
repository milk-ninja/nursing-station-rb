class ChangeAddressToFullAddress < ActiveRecord::Migration
  def change
    rename_column :places, :address, :full_address
  end
end
