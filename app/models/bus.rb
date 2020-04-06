class Bus < ActiveRecord::Base
  belongs_to :user
  belongs_to :operator
  has_many :services, dependent: :destroy
  has_many :vouchers, dependent: :destroy
  has_many :records, through: :services
  has_many :receipts, dependent: :destroy

  enum status: %w(ok checkup)
end
