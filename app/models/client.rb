# frozen_string_literal: true

class Client < ApplicationRecord
  belongs_to :user
  has_many :records, dependent: :destroy

  def sum_clients
    records.map(&:sum_payments).sum.blank? == 0 ? 0 : records.map(&:sum_payments).sum
  end

  def sum_clients_deu
    records.map(&:sum_deuda).sum.blank? == 0 ? 0 : records.map(&:sum_deuda).sum
  end
end
