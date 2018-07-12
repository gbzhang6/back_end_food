
class Api::V1::RestaurantsController < ApplicationController
require "json"
require "http"
require "optparse"

API_KEY = ENV['YELP_KEY']
API_HOST = "https://api.yelp.com"
SEARCH_PATH = "/v3/businesses/search"
BUSINESS_PATH = "/v3/businesses/"
DEFAULT_LOCATION = 'New York, NY'

SEARCH_LIMIT = 50

  def index
    @restaurants = Restaurant.all
    render json: @restaurants
  end

  def create
  end

  def show
  end

  def yelpSearch

    url = "#{API_HOST}#{SEARCH_PATH}"
    yelp_params = {
      term: params[:term],
      location: params[:location],
      price: params[:price],
      limit: SEARCH_LIMIT,
      open_now: true,
    }

    response = HTTP.auth("Bearer #{API_KEY}").get(url, params: yelp_params)
    results = response.parse

    render json:{
      results: results,
      status: :accepted}
  end

  def yelpDetails

    url = "#{API_HOST}#{BUSINESS_PATH}#{params[:term]}"

    response = HTTP.auth("Bearer #{API_KEY}").get(url)
    result = response.parse

    render json:{
      result: result,
      status: :accepted}
  end

end
