require 'pry'

class TweetsProcessor
  def initialize(searchTerm)
    @searchTerm = searchTerm[:searchTerm]
  end

  def twitter_login
    client = Twitter::REST::Client.new do |config|
      config.consumer_key        = ENV['TWITTER_CONSUMER_KEY']
      config.consumer_secret     = ENV['TWITTER_CONSUMER_SECRET']
      config.access_token        = ENV['TWITTER_ACCESS_TOKEN']
      config.access_token_secret = ENV['TWITTER_ACCESS_TOKEN_SECRET']
    end
  end

  def call_twitter
    term = @searchTerm
    results = twitter_login.search("##{term} -rt", {language: "en", include_rts: false}).take(300)
    results
  end

  def parse_tweets
    tweets = self.call_twitter
    all_tweets = tweets.map do |x|
      id = x.attrs[:id]
      username = x.attrs[:user][:screen_name]
      created_at = x.attrs[:created_at]
      date = DateTime.parse(created_at)
      hashtags = x.attrs[:entities][:hashtags].map do |x|
        x[:text]
      end
      retweet_count = x.attrs[:retweet_count]
      content = x.attrs[:text]
      sentiment = SentimentAnalyzer.new
      sentiment.set_default
      sentiment_score = sentiment.score content
      if sentiment_score > 0.1
        sentiment = "positive"
      elsif sentiment_score < -0.1
        sentiment = "negative"
      else sentiment = "neutral"
      end
      tweet = Tweet.new(tweet_identifier: id, username: username, tweet_created_at: date, hashtags: hashtags, retweet_count: retweet_count, content: content, sentiment_score: sentiment_score, sentiment: sentiment)
    end
  end

end
