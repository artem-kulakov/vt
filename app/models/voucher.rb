# frozen_string_literal: true

class Voucher < ApplicationRecord
  belongs_to :operator
  belongs_to :bus

  before_save :fecha

  def fecha
    self.fecha = "#{ano}-#{mes}-01 00:00:00"
  end

  def month
    fecha.to_date.strftime('%G-%B')
  end
end
