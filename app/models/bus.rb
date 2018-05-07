class Bus < ActiveRecord::Base
  belongs_to :user
  belongs_to :operator
  has_many :services
  has_many :vouchers
  has_many :records, through: :services
  has_many :receipts

end
