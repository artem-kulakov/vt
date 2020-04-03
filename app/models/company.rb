class Company < ApplicationRecord
  has_many :users
  has_many :operators, through: :users
  has_many :reviews, through: :operators
end
