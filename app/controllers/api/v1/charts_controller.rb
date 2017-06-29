class Api::V1::ChartsController < ApplicationController

  def index
    render json: Chart.all
  end

  def show
  end

  def create
  end

  def edit
  end

  def update
  end

  def destroy
  end

end
