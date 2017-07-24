class Service < ActiveRecord::Base
  belongs_to :bus
  belongs_to :record
  belongs_to :user
end
