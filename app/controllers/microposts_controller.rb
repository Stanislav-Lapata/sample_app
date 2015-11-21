class MicropostsController < ApplicationController
  before_action :signed_in_user
  before_action :correct_user,   only: :destroy

  def create
    @micropost = current_user.microposts.build(micropost_params)

    respond_to do |format|

      if @micropost.save
        format.html { redirect_to root_url, notice: "Micropost created!" }
        format.js {}
      else
        @feed_items = []
        format.html { render 'static_pages/home' }
      end
    end
  end

  def destroy
    @micropost.destroy
    redirect_to root_url
  end

  private

  def micropost_params
    params.require(:micropost).permit(:content)
  end

  def correct_user
    @micropost = current_user.microposts.find_by(id: params[:id])
    redirect_to root_url if @micropost.nil?
  end
end



