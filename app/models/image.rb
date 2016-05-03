class Image < ActiveRecord::Base
  belongs_to :rating

  has_attached_file :image
  ## TODO: Add validation for paperclip images
end
