# == Schema Information
#
# Table name: votes
#
#  id          :integer          not null, primary key
#  user_id     :integer
#  vote        :integer          default(0)
#  created_at  :datetime         not null
#  updated_at  :datetime         not null
#  entity_id   :integer
#  entity_type :integer
#

class Vote < ActiveRecord::Base
  attr_accessible :entity_id, :entity_type, :id, :user_id, :vote

end
