

# jr@oblique:  1/9/14


class SessionsController < ApplicationController


  def new
  	puts "jx: new"
  end



  def create
 	puts "jx: create"

  	# uses: 	find_by, provided by ActiveRecord 
  	# 			autheticate, provided by has_secure_password
  	user = User.find_by(email: params[:session][:email].downcase)
  	if user && user.authenticate(params[:session][:password])
    	# Sign the user in and redirect to the user's show page.
      	
        sign_in user       # Not yet written 
      	redirect_to user

  	else
    	# Create an error message and re-render the signin form.
    	flash.now[:error] = 'Invalid email/password combination' # Not quite right!
      	render 'new'
  	end

  end



  def destroy
 	  puts "jx: destroy"
    sign_out
    redirect_to root_url
  end

end
