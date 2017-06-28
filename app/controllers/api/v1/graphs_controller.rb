class Api::V1::GraphsController < ApplicationController

  def index
    render json: Graph.all
  end

end
