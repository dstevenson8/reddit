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

require 'spec_helper'

describe Vote do
  pending "add some examples to (or delete) #{__FILE__}"
end
