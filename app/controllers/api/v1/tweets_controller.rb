require 'pry'

class Api::V1::TweetsController < ApplicationController

  def index
    tweets_processor = TweetsProcessor.new
    tweets = tweets_processor.parse_tweets
    render json: tweets, each_serializer: TweetSerializer
  end

  # def index
  #   tweets_processor = TweetsProcessor.new
  #   tweets = tweets_processor.call_twitter(searchTerm)
  #   tweets.parse_tweets(tweets) #fix
  #   render json: tweets, each_serializer: TweetSerializer
  # end

end
