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


  def self.add_vote(entity_type, entity_id, user_id, vote_value)

    entity = nil

    #Ensure the post that is being voted on exists
    if entity_type == 1
      entity = Post.find(entity_id)
    elsif entity_type == 2
      entity = Comment.find(entity_id)
    end

    #Invalid type or no results
    return false if entity == nil

    #Check if vote_value is valid
    return false unless [-1, 0, 1].include? vote_value

    #Check if the user has already voted, and, if they have, update the vote counter accordingly
    # e.g. new vote == -1 and old == 1 
    existing_vote = Vote.where(entity_type: entity_type, entity_id: entity_id, user_id: user_id).first
    if existing_vote != nil #Remove the old vote from the counter if it exists
      entity.votes_up   -= 1 if existing_vote.vote ==  1
      entity.votes_down -= 1 if existing_vote.vote == -1
      existing_vote.vote = vote_value
      existing_vote.save
    else
      Vote.create(entity_type: entity_type, entity_id: entity_id, user_id: user_id, vote: vote_value)
    end

    #Add new vote values
    entity.votes_up   += 1 if vote_value ==  1
    entity.votes_down += 1 if vote_value == -1

    #Save    
    entity.save
  end

end
