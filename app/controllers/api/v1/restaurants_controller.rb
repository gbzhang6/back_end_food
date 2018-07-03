
class Api::V1::RestaurantsController < ApplicationController
require "json"
require "http"
require "optparse"

API_KEY = ENV['YELP_KEY']
API_HOST = "https://api.yelp.com"
SEARCH_PATH = "/v3/businesses/search"
BUSINESS_PATH = "/v3/businesses/"

DEFAULT_BUSINESS_ID = "yelp-san-francisco"
DEFAULT_TERM = "Bar"
DEFAULT_LOCATION = "New York, NY"
SEARCH_LIMIT = 50

  def index
    @restaurants = Restaurant.all
    render json: @restaurants
  end

  def create
  end

  def show
  end

  def yelpSearch(term=DEFAULT_TERM, location=DEFAULT_LOCATION)

    url = "#{API_HOST}#{SEARCH_PATH}"
    params = {
      term: term,
      location: location,
      limit: SEARCH_LIMIT
    }

    response = HTTP.auth("Bearer #{API_KEY}").get(url, params: params)
    results = response.parse

    render json:{
      results: results,
      status: :accepted}
  end

  def filtered
    q = params[:searchTerm]
    query = q.downcase

    @restaurants = makeFetchHappen(query)

   render json: @restaurants
  end


end
