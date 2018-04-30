class Operator < ActiveRecord::Base
  belongs_to :user
  has_many :buses
  has_many :services
  has_many :vouchers
end
