class AddCommentsCountToUsers < ActiveRecord::Migration
  def up
    add_column :users, :comments_count, :integer, default: 0, null: false
  end

  def down
  	remove_column :users, :comments_count
  end
end
