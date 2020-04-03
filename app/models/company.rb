class Company < ApplicationRecord
  has_many :users
  has_many :operators, through: :users
  has_many :reviews, through: :operators
  has_many :buses, through: :users
  has_many :quotations, through: :users
  has_many :records, through: :users
  has_many :services, through: :users
  has_many :receipts, through: :buses
  has_many :clients, through: :users
  has_many :vouchers, through: :operators
end
