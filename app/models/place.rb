class Place < ActiveRecord::Base
  validates :street, presence: true, uniqueness: true
  validates_presence_of :name, :city, :state, :zip
  has_many :ratings

  geocoded_by :full_address, :latitude  => :lat, :longitude => :long
  before_validation :ensure_coords!

  has_attached_file :avatar
  validates_attachment_content_type :avatar, content_type: /\Aimage\/.*\Z/
  validates_attachment_file_name :avatar, matches: [/png\Z/, /jpe?g\Z/]

  def ensure_coords!
    unless self.lat && self.long
      self.geocode
    end
  end

  def full_address
    [street, city, state, zip].compact.join(", ")
  end
end
