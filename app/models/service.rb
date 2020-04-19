# frozen_string_literal: true

class Service < ApplicationRecord
  belongs_to :bus
  belongs_to :record
  belongs_to :user
  belongs_to :operator

  before_save :set_op
  before_save :suma
  before_save :days
  before_save :km_finales
  before_save :rendimiento
  before_save :fecha

  def set_op
    self.operator_id = bus.operator_id
  end

  def sum_gastos
    (hotel.to_f + caseta.to_f + viaticos.to_f + estacionamientos.to_f + lavadas.to_f + aeropuerto.to_f + diesel.to_f + otros).round(2)
  end

  def suma
    self.suma = sum_gastos
  end

  def resourceId
    @resourceId = bus_id
  end

  def days
    self.days = (record.end_time - record.start_time) / 1.day.to_i + 1
  end

  def km_finales
    self.km_finales = km_fin - km_inicio
  end

  def rendimiento
    self.rendimiento = km_finales / litros
  end

  def fecha
    self.fecha = record.start_time.to_date
  end

  def month
    record.start_time.to_date.strftime('%B')
  end

  def year
    record.start_time.to_date.strftime('%G')
  end
end
