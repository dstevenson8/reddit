class AddVotesUpAndVotesDownToUsers < ActiveRecord::Migration
  def change
    add_column :users, :votes_up, :integer, default: 0, null: false
    add_column :users, :votes_down, :integer, default: 0, null: false
  end
end
