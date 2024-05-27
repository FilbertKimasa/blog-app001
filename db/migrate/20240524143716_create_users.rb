class CreateUsers < ActiveRecord::Migration[7.1]
  def change
    create_table :users do |t|
      t.string :name, null: false
      t.text :photo, null: false  # URL to an image
      t.text :bio
      t.integer :posts_counter, default: 0
      t.timestamps
    end
  end
end
