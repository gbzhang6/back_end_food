class UserSerializer < ActiveModel::Serializer
  attributes :id, :username

  has_many :matches
  has_many :comments
end
