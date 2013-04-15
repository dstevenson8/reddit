class ChangePostsSubredditIdType < ActiveRecord::Migration
  def up
  	change_column :posts, :subreddit_id, :string, :limit => 16
  end

  def down
  	change_column :posts, :subreddit_id, :integer
  end
end
