class Api::V1::MatchesController < ApplicationController

  def index
    @matches = Match.all
    render json: @matches
  end

  def create
    @restaurant = Restaurant.find_or_create_by(
      yelp_id: params[:restaurant][:id],
      name: params[:restaurant][:name],
      location: params[:restaurant][:location][:display_address],
      rating: params[:restaurant][:rating],
      price: params[:restaurant][:price],
      image_url: params[:restaurant][:image_url],
      review_count:params[:restaurant][:review_count],
      photos:'',
      longitude:params[:restaurant][:coordinates][:longitude],
      latitude:params[:restaurant][:coordinates][:latitude],
    )
    @match = Match.new(user_id:params[:user_id], restaurant_id: @restaurant.id)
    # @match.restaurant_id = params[:restaurant_id]
    # @match.user_id = params[:user_id]
    if (@match.save)
      render json: {
        id: @match.id,
        restaurant_id: @match.restaurant_id,
        user_id: @match.user_id,
      }
    else
      render json: {
        errors: "Those credentials don't match anything we have in our database"
      }, status: :unprocessable_entity
    end
  end

  def show

  end

  def destroy
  end

  private

  def match_params
    params.permit(:user_id, :restaurant_id, :restaurant)
  end

end
