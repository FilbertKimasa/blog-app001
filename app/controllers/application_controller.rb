class ApplicationController < ActionController::Base
  rescue_from ActiveRecord::RecordNotFound, with: :render404

  private

  def set_user
    @user = User.find(params[:user_id] || params[:id])
  end

  def render404
    render file: "#{Rails.root}/public/404.html", status: :not_found
  end
end
