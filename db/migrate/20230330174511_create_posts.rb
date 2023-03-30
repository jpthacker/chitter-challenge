class CreatePosts < ActiveRecord::Migration[7.0]
  def change
    create_table :posts do |t|
      t.text :text
      t.bigint :user_id
      t.timestamps
    end
    add_foreign_key :posts, :users
  end
end
