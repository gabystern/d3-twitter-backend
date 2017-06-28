class TweetSerializer < ActiveModel::Serializer
  attributes :id, :tweet_identifier, :hashtags, :content, :retweet_count, :tweet_created_at
  belongs_to :graph
end
