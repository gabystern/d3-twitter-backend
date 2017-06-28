require 'pry'
class TweetsProcessor

  def twitter_login
    client = Twitter::REST::Client.new do |config|
      config.consumer_key        = ENV['TWITTER_CONSUMER_KEY']
      config.consumer_secret     = ENV['TWITTER_CONSUMER_SECRET']
      config.access_token        = ENV['TWITTER_ACCESS_TOKEN']
      config.access_token_secret = ENV['TWITTER_ACCESS_TOKEN_SECRET']
    end
  end

  def call_twitter
    results = twitter_login.search("#travelban -rt", {language: "en", include_rts: false}).take(100)
    results
  end

  def parse_tweets()
    tweets = self.call_twitter
    all_tweets = tweets.map do |x|
      id = x.attrs[:id]
      created_at = x.attrs[:created_at]
      date = Date.parse(created_at).strftime("%m/%d/%Y")
      hashtags = x.attrs[:entities][:hashtags].map do |x|
        x[:text]
      end
      retweet_count = x.attrs[:retweet_count]
      content = x.attrs[:text]
      tweet = Tweet.new(tweet_identifier: id, tweet_created_at: date, hashtags: hashtags, retweet_count: retweet_count, content: content)
    end
  end

end

# ajaxcall on submit
