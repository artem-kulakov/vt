# frozen_string_literal: true

class Receipt < ApplicationRecord
  belongs_to :bus
  belongs_to :expense

  before_save :categoria
  before_save :cantidad
  before_save :nota
  before_save :fecha

  def categoria
    self.categoria = expense.categoria
  end

  def cantidad
    self.cantidad = expense.cantidad
  end

  def nota
    self.nota = expense.nota
  end

  def fecha
    self.fecha = expense.fecha
  end

  def month
    fecha.to_date.strftime('%B')
  end

  def year
    fecha.to_date.strftime('%G')
  end
end
