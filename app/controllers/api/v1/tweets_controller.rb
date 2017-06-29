require 'pry'

class Api::V1::TweetsController < ApplicationController

  def index
  end

  def show
  end

  def create
    tweets_processor = TweetsProcessor.new({
      searchTerm: params[:search_term]})
    tweets = tweets_processor.parse_tweets
    render json: tweets, each_serializer: TweetSerializer
  end

  def edit
  end

  def update
  end

  def destroy
  end

  # private
  #
  # def processor_params
  #   params.require(:tweetsprocessor).permit(:search_term)
  # end


end
