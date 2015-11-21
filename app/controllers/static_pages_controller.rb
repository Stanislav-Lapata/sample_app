class StaticPagesController < ApplicationController
  def home
    respond_to do |format|
      if signed_in?
       format.html { @micropost  = current_user.microposts.build }
       format.js
        @feed_items = current_user.feed.paginate(page: params[:page])
      end
    end
  end

  def help
  end

  def about
  end

  def contact
  end
end
