class Place < ActiveRecord::Base
  validates :street, presence: true, uniqueness: true
  validates_presence_of :name, :city, :state, :zip
  has_many :ratings
end
