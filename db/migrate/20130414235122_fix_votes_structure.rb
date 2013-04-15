class FixVotesStructure < ActiveRecord::Migration

	def up
		remove_column :votes, :comment_id
		add_column :votes, :entity_id, :integer
		add_column :votes, :entity_type, :integer
	end

	def down
		add_column :votes, :comment_id, :integer
		remove_column :votes, :entity_id
		remove_column :votes, :entity_type
	end 
end
