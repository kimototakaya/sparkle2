class CreatePosts < ActiveRecord::Migration[6.0]
  def change
    create_table :posts do |t|
      t.text :content,       null:false
      t.text :title,         null:false
      t.string :image
      t.integer :user_id, null:false, foreign_key: true
      t.timestamps
    end
  end
end
