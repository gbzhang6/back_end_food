class RestaurantSerializer < ActiveModel::Serializer
  attributes :id, :name, :image_url, :price, :rating, :review_count, :photos

  has_many :matches
  has_many :comments
end
