

#jr@oblique: 24/9/14


class StaticPagesController < ApplicationController


# Executes the code and then renders the view


#jx 
  #def home
  #  @micropost = current_user.microposts.build if signed_in?
  #end
  def home
    if signed_in?
      @micropost  = current_user.microposts.build
      @feed_items = current_user.feed.paginate(page: params[:page])
    end
  end


  def help
  end


  def about
  end


  def contact
  end

end
