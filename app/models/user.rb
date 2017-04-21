class User < ApplicationRecord
  has_secure_password

  has_many :ideas
  has_many :likes
  has_many :ideas, through: :likes
end
