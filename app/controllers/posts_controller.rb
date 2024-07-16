class PostsController < ApplicationController
  before_action :set_user
 # before_action :set_post, only: [:show]

  def index
    @posts = @user.posts.order(created_at: :asc).includes(:comments, :likes).page(params[:page]).per(2)
  end

  def show
    @post = @user.posts.includes(:comments, :likes).where(id: params[:id]).first
    raise ActiveRecord::RecordNotFound if @post.nil?
  end
end
