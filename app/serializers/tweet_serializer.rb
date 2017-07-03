class TweetSerializer < ActiveModel::Serializer
  attributes :tweet_identifier, :username, :hashtags, :content, :retweet_count, :tweet_created_at, :sentiment_score, :sentiment

end
