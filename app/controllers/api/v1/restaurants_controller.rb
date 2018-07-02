class Api::V1::RestaurantsController < ApplicationController

  def index
    decoded_token = JWT.decode token,

    @restaurants = Restaurant.all
    render json: @restaurants
  end

  def create
  end

  def show
  end
end
