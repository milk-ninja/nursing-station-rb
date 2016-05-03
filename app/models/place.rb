class Place < ActiveRecord::Base
  validates :street, presence: true, uniqueness: true
  validates_presence_of :name, :city, :state, :zip
  has_many :ratings

  geocoded_by :full_address, :latitude  => :lat, :longitude => :long
  before_validation :ensure_coords!

  def ensure_coords!
    unless self.lat && self.long
      self.geocode
    end
  end

  def full_address
    [street, city, state, zip].compact.join(", ")
  end
end
