class DashboardController < ApplicationController
  before_action :authorize!

  def show
    @user = current_user
    @client = current_client
  end

end