class Place < ActiveRecord::Base
  validates :street, presence: true, uniqueness: true
  validates_presence_of :name, :city, :state
  has_many :ratings

  geocoded_by :full_address, :latitude  => :lat, :longitude => :lng
  before_validation :ensure_coords!

  has_attached_file :avatar, :default_url => "https://tiyatlanta.slack.com/files/mallerie/F16FW6ZQD/ninja_head.png"
  validates_attachment_content_type :avatar, content_type: /\Aimage\/.*\Z/
  validates_attachment_file_name :avatar, matches: [/png\Z/, /jpe?g\Z/]

  def ensure_coords!
    unless self.lat && self.lng
      self.geocode
    end
  end

  def full_address
    [street, city, state, zip].compact.join(", ")
  end

  def avg_privacy
    self.ratings.average(:privacy)
  end

  def avg_cleanliness
    self.ratings.average(:cleanliness)
  end
end
