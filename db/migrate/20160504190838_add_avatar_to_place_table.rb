class AddAvatarToPlaceTable < ActiveRecord::Migration
  def up
    add_attachment :places, :avatar
  end
  def down
    remove_attachment :places, :avatar 
  end
end
