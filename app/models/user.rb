

class User < ActiveRecord::Base


# Before save callback, to enforce downcasing
  before_save { self.email = email.downcase }


  validates :name,  presence: true, length: { maximum: 50 } 

# Use a regular expression to validate email format 
  VALID_EMAIL_REGEX = /\A[\w+\-.]+@[a-z\d\-.]+\.[a-z]+\z/i

  validates :email, 
  			presence: true, 
  			format: { with: VALID_EMAIL_REGEX },
            uniqueness: { case_sensitive: false }


  has_secure_password
end

