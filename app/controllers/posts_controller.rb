class PostsController < ApplicationController
  #before_action :set_user
  before_action :set_user, only: [:index, :show, :new, :create]

  def index
    @posts = @user.posts.order(created_at: :asc).includes(:comments, :likes).page(params[:page]).per(2)
  end

  def show
    @post = @user.posts.includes(:comments, :likes).where(id: params[:id]).first
    raise ActiveRecord::RecordNotFound if @post.nil?
  end

  def new
    @post = @user.posts.new
  end

  def create
    @post = @user.posts.new(post_params)
    if @post.save
      #redirect_to @post, notice: 'Post was successfully created.'
      redirect_to user_post_path(@user, @post), notice: 'Post was successfully created.'
    else
      render :new
    end
  end

  private

  def set_user
    @user = current_user
  end

  def post_params
    params.require(:post).permit(:title, :text)
  end
end
