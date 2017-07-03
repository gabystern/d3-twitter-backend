class Tweet
  include ActiveModel::Model
  include ActiveModel::Serialization
  attr_accessor :tweet_identifier, :username, :tweet_created_at, :hashtags, :retweet_count, :content, :sentiment_score, :sentiment

  alias :read_attribute_for_serialization :send

  def initialize(attributes = {})
    attributes.each do |name, value|
      send("#{name}=", value)
    end
  end

end
