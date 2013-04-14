class Comment < ActiveRecord::Base
  attr_accessible :post_id, :text, :user_id, :votes_down, :votes_up
end
