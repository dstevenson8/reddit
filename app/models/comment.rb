# == Schema Information
#
# Table name: comments
#
#  id         :integer          not null, primary key
#  user_id    :integer
#  post_id    :integer
#  text       :text
#  votes_up   :integer          default(0)
#  votes_down :integer          default(0)
#  created_at :datetime         not null
#  updated_at :datetime         not null
#

class Comment < ActiveRecord::Base
  attr_accessible :post_id, :text, :user_id, :votes_down, :votes_up

  belongs_to :post, :counter_cache => true
  belongs_to :user, :counter_cache => true
end
