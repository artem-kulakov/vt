class Record < ActiveRecord::Base
  belongs_to :client
  belongs_to :user
  has_many :services
end
