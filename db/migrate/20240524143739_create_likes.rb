class CreateLikes < ActiveRecord::Migration[7.1]
  def change
    create_table :likes do |t|
      t.references :user, null: false, foreign_key: true
      t.references :post, null: false, foreign_key: true
      t.timestamps
    end

    add_index :likes, :user_id, name: 'index_likes_on_user_id'
    add_index :likes, :post_id, name: 'index_likes_on_post_id'
  end
end
