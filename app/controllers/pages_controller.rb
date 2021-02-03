class PagesController < ApplicationController
  before_action :authenticate_user!, only: [:home, :profile]

  def home
  end
  
  def profile
    @user = User.find_by_username(params[:id])
  end

  def message
  end

  def search
    search = params[:query]
    if search.blank?
      @user = User.all
    else
      @user = User.where("username LIKE ?", "%#{search}%")
    end
    respond_to do |format|
      format.html { render :home }
      format.js
    end
  end
end

