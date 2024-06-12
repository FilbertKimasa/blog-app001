class PostsController < ApplicationController
  def index
    @user = User.find(params[:user_id])
   
    @posts = @user.posts.order(created_at: :desc).includes(:comments, :likes).page(params[:page]).per(2)

  end

  def show; end
end

