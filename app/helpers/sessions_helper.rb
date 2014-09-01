

# jr@oblique:  1/9/14


module SessionsHelper


  def sign_in(user)

  	# Create a remember_token
    remember_token = User.new_remember_token
    
    # Save it in a browser cookie 
    cookies.permanent[:remember_token] = remember_token
    
    # Save the hashed token to the db 
    user.update_attribute(:remember_token, User.digest(remember_token))
    
    # Set the current user equal to the given user   
    self.current_user = user

  end


  def signed_in?
    !current_user.nil?
  end


  def current_user=(user)
    @current_user = user
  end

  def current_user
    remember_token = User.digest(cookies[:remember_token])
    # works only if @current_user is undefined 
    @current_user ||= User.find_by(remember_token: remember_token)
  end



  def sign_out
    current_user.update_attribute(:remember_token,
                                  User.digest(User.new_remember_token))
    cookies.delete(:remember_token)
    self.current_user = nil
  end
  
end
