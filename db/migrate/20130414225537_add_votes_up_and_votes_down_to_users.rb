class AddVotesUpAndVotesDownToUsers < ActiveRecord::Migration
  def change
    add_column :users, :votes_up, :integer
    add_column :users, :votes_down, :integer
  end
end
