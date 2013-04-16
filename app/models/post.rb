# == Schema Information
#
# Table name: posts
#
#  id             :integer          not null, primary key
#  title          :string(255)
#  text           :text
#  user_id        :integer
#  votes_up       :integer          default(0)
#  votes_down     :integer          default(0)
#  comments_count :integer          default(0)
#  created_at     :datetime         not null
#  updated_at     :datetime         not null
#  subreddit_id   :string(16)
#

class Post < ActiveRecord::Base
  attr_accessible :comments_count, :text, :title, :user_id, :votes_down, :votes_up, :subreddit_id

  validates :title, :length => { :in => 3..255 }
  validates :user_id, :presence => true

  belongs_to :subreddit
  has_many :comments
  belongs_to :user

end
