# app/models/user.rb
class User < ApplicationRecord
  has_many :posts, foreign_key: :author_id, dependent: :destroy
  has_many :comments, dependent: :destroy
  has_many :likes, dependent: :destroy

  validates :name, presence: true
  # validates :photo, presence: true # Assuming photo is required
  validates :posts_counter, numericality: { only_integer: true, greater_than_or_equal_to: 0 }

  def index
    User.all
  end

  def recent_posts
    posts.order(created_at: :desc).limit(3)
  end
end
