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

require 'spec_helper'

describe Subreddit do
  pending "add some examples to (or delete) #{__FILE__}"
end
