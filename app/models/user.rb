class User < ActiveRecord::Base
  has_secure_password
  # validates :password, presence: true, uniqueness: true, length: { in: 6..20,
  #                 message: "Must be between 4 and 15 characters"
  # }
  # validates :email, presence: true, uniqueness: true, format: {
  #           with: /.+@.+\..+/, message: "Please put in valid email"
  # }
  # validates_presence_of :first_name, :last_name, :email, :password
  has_attached_file :avatar, styles: { medium: "300x300>", thumb: "100x100>" }, default_url: "/images/:style/missing.png"
  validates_attachment_content_type :avatar, content_type: /\Aimage\/.*\Z/

  def ensure_auth_token
    unless self.auth_token
      self.auth_token = User.generate_token
    end
  end

  def self.generate_token
    token = SecureRandom.hex
    while User.exists?(auth_token: token)
      token = SecureRandom.hex
    end
      token
  end
end
