# app/models/post.rb
class Post < ApplicationRecord
    belongs_to :author, class_name: 'User'
    has_many :comments, dependent: :destroy
    has_many :likes, dependent: :destroy
  
    validates :title, presence: true
    validates :text, presence: true
  end
  