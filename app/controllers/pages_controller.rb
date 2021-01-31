class PagesController < ApplicationController
  before_action :authenticate_user!, only: [:home, :profile]

  def home
  end
  
  def profile
    @user = User.find_by_username(params[:id])
  end

  def message
  end
end

