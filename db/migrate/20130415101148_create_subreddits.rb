class CreateSubreddits < ActiveRecord::Migration
  def change
    create_table :subreddits do |t|
      t.string :title
      t.string :url
      t.text :text

      t.timestamps
    end
  end
end