class MatchSerializer < ActiveModel::Serializer
  attributes :id, :restaurant_id, :user_id
  belongs_to :user
  belongs_to :restaurant
end
