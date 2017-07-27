class Record < ActiveRecord::Base
  belongs_to :client
  belongs_to :user
  has_many :services
  has_many :buses, through: :services
  has_many :payments
  has_many :routes
end
