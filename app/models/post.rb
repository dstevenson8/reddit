class Post < ActiveRecord::Base
  attr_accessible :comments_count, :text, :title, :user_id, :votes_down, :votes_up
end
