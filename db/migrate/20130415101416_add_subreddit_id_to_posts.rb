class AddSubredditIdToPosts < ActiveRecord::Migration
  def change
    add_column :posts, :subreddit_id, :integer
  end
end
