class Restaurant < ApplicationRecord
  has_many :matches
  has_many :users, through: :matches
  has_many :comments
end
