class DashboardController < ApplicationController
  before_action :authorize!

  def show
    @posts = current_client.user_recent_media
  end

  def feed
    @posts = current_client.user_media_feed
  end

  def search
    tags = current_client.tag_search(params[:search])
    if tags[0].nil?
      flash.now[:notice] = "No search results match!"
      @posts = current_client.user_recent_media
    else
      @posts = current_client.tag_recent_media(tags[0].name)
    end
  end

end