class RestaurantSerializer < ActiveModel::Serializer
  attributes :id, :name, :image_url, :price, :rating, :review_count, :photos, :longitude, :latitude, :yelp_id, :location, :reviews

  has_many :matches
  has_many :comments
end
