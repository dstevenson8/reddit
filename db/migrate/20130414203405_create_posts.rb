class CreatePosts < ActiveRecord::Migration
  def change
    create_table :posts do |t|
      t.string :title
      t.text :text
      t.integer :user_id
      t.integer :votes_up
      t.integer :votes_down
      t.integer :comments_count, :default => 0

      t.timestamps
    end
  end
end
