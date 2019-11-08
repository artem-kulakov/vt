class Service < ActiveRecord::Base
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
    self.operator_id = self.bus.operator_id
  end

  def sum_gastos
    (self.hotel.to_f+self.caseta.to_f+self.viaticos.to_f+self.estacionamientos.to_f+self.lavadas.to_f+self.aeropuerto.to_f+self.diesel.to_f+self.otros).round(2)
  end

  def suma
    self.suma = sum_gastos
  end

  def resourceId
      @resourceId = self.bus_id
  end

  def days
      self.days = (self.record.end_time - self.record.start_time)/1.day.to_i+1
  end

  def km_finales
      self.km_finales = self.km_fin - self.km_inicio
  end

  def rendimiento
      self.rendimiento = self.km_finales/self.litros
  end

  def fecha
    self.fecha = record.start_time.to_date
  end

def month
  self.record.start_time.to_date.strftime('%B')
end

def year
  self.record.start_time.to_date.strftime('%G')
end

end
