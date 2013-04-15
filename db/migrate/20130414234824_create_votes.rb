class CreateVotes < ActiveRecord::Migration
  def change
    create_table :votes do |t|
      t.integer :id
      t.integer :user_id
      t.integer :comment_id
      t.integer :vote, default: 0

      t.timestamps
    end
  end
end