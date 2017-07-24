class Operator < ActiveRecord::Base
  belongs_to :user
  has_many :buses
  has_many :services
end
