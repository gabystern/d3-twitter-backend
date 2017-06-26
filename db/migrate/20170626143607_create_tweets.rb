class CreateTweets < ActiveRecord::Migration[5.1]
  def change
    create_table :tweets do |t|
      t.string :tweet_id
      t.string :hashtag
      t.string :text
      t.string :retweet_count
      t.string :coordinates
      t.string :tweet_created_at

      t.timestamps
    end
  end
end
