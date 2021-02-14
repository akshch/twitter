class CreateComment < ActiveRecord::Migration[5.2]
  def change
    create_table :comments do |t|
      t.text :content
      t.integer :user_id
      t.integer :tweet_id

      t.timestamps
    end
  end
end
