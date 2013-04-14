class CreateComments < ActiveRecord::Migration
  def change
    create_table :comments do |t|
      t.integer :user_id
      t.integer :post_id
      t.text :text
      t.integer :votes_up
      t.integer :votes_down

      t.timestamps
    end
  end
end
