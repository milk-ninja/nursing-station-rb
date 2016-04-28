class Place < ActiveRecord::Base
  validates :address, presence: true, uniqueness: true
  validates_presence_of :name
  has_many :ratings
end
