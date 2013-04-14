# == Schema Information
#
# Table name: posts
#
#  id             :integer          not null, primary key
#  title          :string(255)
#  text           :text
#  user_id        :integer
#  votes_up       :integer
#  votes_down     :integer
#  comments_count :integer          default(0)
#  created_at     :datetime         not null
#  updated_at     :datetime         not null
#

class Post < ActiveRecord::Base
  attr_accessible :comments_count, :text, :title, :user_id, :votes_down, :votes_up

  has_many :comments
end
