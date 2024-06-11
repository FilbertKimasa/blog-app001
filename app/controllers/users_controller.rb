class UsersController < ApplicationController
  def index
    @users = User.all
  end

  def show
    @user = User.find(params[:id])
    @recent_posts = @user.posts.order(created_at: :desc).includes(:likes, :comments).page(params[:page]).per(3)
  end
end
