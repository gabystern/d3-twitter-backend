class GraphTweetSerializer < ActiveModel::Serializer
  attributes :id, :tweet_identifier, :hashtags, :content, :retweet_count, :tweet_created_at
end
