class User < ActiveRecord::Base
  has_secure_password
  has_attached_file :avatar
  validates_attachment_content_type :avatar, content_type: /\Aimage\/.*\Z/
  validates_attachment_file_name :avatar, matches: [/png\Z/, /jpe?g\Z/]

  validates :email, presence: true, uniqueness: true, format: {
            with: /.+@.+\..+/, message: "Please put in valid email"
  }
  validates_presence_of :first_name, :last_name, :email
  # validates :username, presence: true, uniqueness: true
  has_many :ratings

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
