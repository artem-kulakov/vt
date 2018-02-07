class Client < ActiveRecord::Base
  belongs_to :user
  has_many :records

  def sum_clients
    self.records.map(&:sum_payments).sum.blank? == 0 ? 0 : self.records.map(&:sum_payments).sum
  end

  def sum_clients_deu
    self.records.map(&:sum_deuda).sum.blank? == 0 ? 0 : self.records.map(&:sum_deuda).sum
  end

end
