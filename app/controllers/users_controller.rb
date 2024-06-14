class UsersController < ApplicationController
  before_action :set_user, except: [:index]

  def index
    @users = User.all
  end

  def show
    @recent_posts = @user.posts.includes(:likes, :comments).limit(3)
  end
end
