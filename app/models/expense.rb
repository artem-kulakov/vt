# frozen_string_literal: true

class Expense < ApplicationRecord
  has_many :receipts, dependent: :destroy
  accepts_nested_attributes_for :receipts, reject_if: ->(a) { a[:bus_id].blank? }, allow_destroy: true
  before_save :fecha

  def fecha
    self.fecha = "#{ano}-#{mes}-01 00:00:00"
    end

  def month
    fecha.to_date.strftime('%G-%B')
  end
end
