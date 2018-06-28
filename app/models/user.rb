class User < ApplicationRecord
  has_many :matches
  has_many :restaurants, through: :matches
  has_many :comments

  has_secure_password

  validates :username, presence: true, uniqueness: true
  validates :password, presence: true
  validates_presence_of :email
  validates_uniqueness_of :email, case_sensitive: false
  validates_format_of :email, with: /@/

end
