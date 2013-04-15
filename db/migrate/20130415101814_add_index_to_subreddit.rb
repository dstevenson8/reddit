class AddIndexToSubreddit < ActiveRecord::Migration
  def up
  	add_index :subreddits, :url, :name => 'subreddit_index'
  end

  def down
  	remove_index :subreddits, 'subreddit_index'
  end
end
