# app/models/like.rb
class Like < ApplicationRecord
    belongs_to :user
    belongs_to :post

    after_save :update_likes_counter

    # Updates the likes counter for a post
    def update_likes_counter
      post.update(likes_counter: post.likes.count)
    end
  end
  