class Api::V1::RestaurantController < ApplicationController
  def index
    @restaurants = Restaurant.all
    render json: @restaurants
  end

  def create
  end
end
