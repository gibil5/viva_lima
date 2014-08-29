

class UsersController < ApplicationController

  
  # http Get requests are handled by the Show action
  # params is provided by Get  
  def show
    @user = User.find(params[:id])
  end


  def new
    @user = User.new
  end


   
#jx 
  def create
    #@user = User.new(params[:user])    # Not the final implementation!
    @user = User.new(user_params)


    if @user.save
    	flash[:success] = "Welcome to the Sample App!"
    	redirect_to @user
    else
      render 'new'
    end

  end 


  private
  
    def user_params
      params.require(:user).permit(:name, :email, :password,
                                   :password_confirmation)
    end



end
