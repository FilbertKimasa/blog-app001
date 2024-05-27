# app/models/user.rb
class User < ApplicationRecord
    has_many :posts, foreign_key: :author_id, dependent: :destroy
    has_many :comments, dependent: :destroy
    has_many :likes, dependent: :destroy
  
    validates :name, presence: true
    # validates :photo, presence: true # Assuming photo is required
  end
  