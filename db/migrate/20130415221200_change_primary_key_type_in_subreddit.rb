class ChangePrimaryKeyTypeInSubreddit < ActiveRecord::Migration
  def up
  	change_column :subreddits, :id, :string, :limit => 16
  end

  def down
  	change_column :subreddits, :id, :integer
  end
end
