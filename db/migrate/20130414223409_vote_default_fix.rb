class VoteDefaultFix < ActiveRecord::Migration
  def up
  	change_column :posts, 	 :votes_up, 	:integer, :default => 0
  	change_column :posts, 	 :votes_down, 	:integer, :default => 0
  	change_column :comments, :votes_up, 	:integer, :default => 0
  	change_column :comments, :votes_down, 	:integer, :default => 0
  end

  def down
  	change_column :posts, 	 :votes_up, 	:integer, :default => nil
  	change_column :posts, 	 :votes_down, 	:integer, :default => nil
  	change_column :comments, :votes_up, 	:integer, :default => nil
  	change_column :comments, :votes_down, 	:integer, :default => nil
  end
end
