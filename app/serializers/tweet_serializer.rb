class TweetSerializer < ActiveModel::Serializer
  attributes :tweet_identifier, :hashtags, :content, :retweet_count, :tweet_created_at

end
