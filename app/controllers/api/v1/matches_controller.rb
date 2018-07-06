class Api::V1::MatchesController < ApplicationController

  def index
    @matches = Match.all
    render json: @matches
  end

  def create
    @match = Match.new(match_params)

    @match.restaurant_id = params[:restaurant_id]
    @match.user_id = params[:user_id]
    if (@match.save)
      render json: {
        restaurant_id: @match.restaurant_id,
        user_id: @match.user_id,
      }
    else
      flash[:error] = 'Failed to edit match!'
      render :new
    end
  end

  def show
  end

  def destroy
  end

  private

  def match_params
    params.permit(:user_id, :restaurant_id)
  end

end
