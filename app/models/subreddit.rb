# == Schema Information
#
# Table name: subreddits
#
#  id         :integer          not null, primary key
#  title      :string(255)
#  url        :string(255)
#  text       :text
#  created_at :datetime         not null
#  updated_at :datetime         not null
#

class Subreddit < ActiveRecord::Base
  attr_accessible :text, :title, :url
  has_many :posts
end
