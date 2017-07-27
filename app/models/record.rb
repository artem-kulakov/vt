class Record < ActiveRecord::Base
  belongs_to :client
  belongs_to :user
  has_many :services
  has_many :buses, through: :services
  has_many :payments
  has_many :routes

  def sum_payments
    payments.count == 0 ? 0 : payments.sum(:cantidad).round(2)
  end

end
