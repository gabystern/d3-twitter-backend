class Api::V1::SearchesController < ApplicationController

  def index
    render json: Search.all
  end
end
