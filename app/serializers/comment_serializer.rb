class CommentSerializer < ActiveModel::Serializer
  attributes :id, :user_id, :restaurant_id, :description
  belongs_to :user
  belongs_to :restaurant
end
