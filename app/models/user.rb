

class User < ActiveRecord::Base
# Before save callback, to enforce downcasing
  before_save { self.email = email.downcase }




# Validation block 

  # name 
  validates :name,  presence: true, length: { maximum: 50 } 

  # email: using a regular expression to validate format 
  VALID_EMAIL_REGEX = /\A[\w+\-.]+@[a-z\d\-.]+\.[a-z]+\z/i

  validates :email, 
  			presence: true, 
  			format: { with: VALID_EMAIL_REGEX },
           uniqueness: { case_sensitive: false }



  #jr
  has_secure_password
  validates :password, length: { minimum: 6 } 

end

