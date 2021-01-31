class PostsController < ApplicationController

  before_action :authenticate_user!
  before_action :find_user
  before_action :find_post, only: [:edit, :update, :destroy, :show]

  def new
    @post = @user.posts.build
    respond_to do |format|
      format.js
    end
  end

  def create
    @post = @user.posts.build(post_params)
    respond_to do |format|
      if @post.save
        format.html { redirect_to profile_path(current_user.username), notice: "Post was successfully created."}
      else
        format.html { redirect_to profile_path(current_user.username), alert: "Please provide value for fields." }
      end
    end
  end

  def edit
  end

  def update
    if @post.update(post_params)
      flash[:notice] = "Post was updated successfully"
      redirect_to home_path
    else
      flash[:alert] = "There was an error in udpating posts"
      render edit
    end
  end

  def show
  end

  def destroy
    @post.destroy
    redirect_to home_path
  end

  private

  def find_user
    @user = User.find(params[:user_id])
  end

  def find_post
    @post = @user.posts.find(params[:id])
  end

  def post_params
    params.require(:post).permit(:desc, :post_url)
  end

end

