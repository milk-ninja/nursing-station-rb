class Rating < ActiveRecord::Base
  belongs_to :user
  belongs_to :place

  has_many :images
end
