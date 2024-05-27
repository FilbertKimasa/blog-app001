class CreateComments < ActiveRecord::Migration[7.1]
  def change
    create_table :comments do |t|
      t.references :user, null: false, foreign_key: true
      t.references :post, null: false, foreign_key: true
      t.text :text, null: false
      t.timestamps
    end

    add_index :comments, :user_id, name: 'index_comments_on_user_id'
    add_index :comments, :post_id, name: 'index_comments_on_post_id'
  end
end
