class User < ActiveRecord::Base
  has_secure_password

  validates :password, format: {
              with: /.\w{4,15}/, message: "Must be between 4 and 15 characters"
  }
  validate :email, format: {
            with: /.+@.+\..+/, message: "Please put in valid email"
  }
  validates_presence_of :first_name, :last_name, :email, :password
end
