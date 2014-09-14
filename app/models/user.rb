

class User < ActiveRecord::Base

# Callbacks 
# Before save callback, to enforce downcasing
  before_save { self.email = email.downcase }

  # Create a remember_token, after creation of the user 
  before_create :create_remember_token


# Validation block 
  validates :name,  presence: true, length: { maximum: 50 } 
  # email: using a regular expression to validate format 
  VALID_EMAIL_REGEX = /\A[\w+\-.]+@[a-z\d\-.]+\.[a-z]+\z/i
  validates :email, 
  			presence: true, 
  			format: { with: VALID_EMAIL_REGEX },
           uniqueness: { case_sensitive: false }
  has_secure_password
  validates :password, length: { minimum: 6 } 




# Create remember token 
  def User.new_remember_token
    SecureRandom.urlsafe_base64
  end

  def User.digest(token)
    Digest::SHA1.hexdigest(token.to_s)
  end


  private

    def create_remember_token
      self.remember_token = User.digest(User.new_remember_token)
    end

end

