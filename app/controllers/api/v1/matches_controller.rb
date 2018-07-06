class Api::V1::MatchesController < ApplicationController

  def index
    @matches = Match.all
    render json: @matches
  end

  def create
    get_decoded_token
    @match = Match.new(match_params)
    byebug
    # Restaurant.find_or_create_by(restaurant_obj)
    @match.restaurant_id = params[:restaurant_id]
    @match.user_id = params[:user_id]
    byebug
    if (@match.save)
      render json: {
        id: @match.id
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
    params.permit(:user_id, :restaurant_id, :)
  end

end
