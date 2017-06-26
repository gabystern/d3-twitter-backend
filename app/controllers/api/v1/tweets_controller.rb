require 'pry'

class Api::V1::TweetsController < ApplicationController

  def index
    render json: Tweet.all
  end

  def create
    tweets_processor = TweetsProcessor.new
    tweets = tweets_processor.call_twitter
    all_tweets = tweets.map do |x|
      id = x.attrs[:id]
      created_at = x.attrs[:created_at]
      hashtags = x.attrs[:entities][:hashtags].map do |x|
        x[:text]
      end
      retweet_count = x.attrs[:retweet_count]
      content = x.attrs[:text]
      Tweet.new(tweet_identifier: id, tweet_created_at: created_at, hashtags: hashtags, retweet_count: retweet_count, content: content, graph_id: 1)
    end
    saved_tweets = all_tweets.each do |tweet|
      tweet.save
    end
    render json: saved_tweets
  end

  def edit
  end

  def update
  end

  def destroy
  end

end