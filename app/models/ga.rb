# frozen_string_literal: true

class Ga < ApplicationRecord
  before_save :fecha

  def fecha
    self.fecha = "#{ano}-#{mes}-01 00:00:00"
  end

  def month
    fecha.to_date.strftime('%G-%B')
  end
end
