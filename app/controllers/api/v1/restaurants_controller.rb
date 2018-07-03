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

  def filtered
    q = params[:searchTerm]
    query = q.downcase

    @restaurants = makeFetchHappen(query)

   render json: @restaurants
  end
end
