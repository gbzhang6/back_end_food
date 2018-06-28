class Api::V1::MatchesController < ApplicationController
  def index
    @matches = Match.all
    render json: @matches
  end

  def create
  end
end
