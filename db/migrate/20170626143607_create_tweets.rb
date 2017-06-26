class CreateTweets < ActiveRecord::Migration[5.1]
  def change
    create_table :tweets do |t|
      t.string :tweet_identifier
      t.string :hashtags
      t.string :content
      t.string :retweet_count
      t.string :tweet_created_at
      t.integer :graph_id

      t.timestamps
    end
  end
end
