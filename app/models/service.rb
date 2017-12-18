class Service < ActiveRecord::Base
  belongs_to :bus
  belongs_to :record
  belongs_to :user

  def sum_gastos
    (self.hotel.to_f+self.caseta.to_f+self.viaticos.to_f+self.estacionamientos.to_f+self.lavadas.to_f+self.aeropuerto.to_f+self.diesel.to_f+self.otros).round(2)
  end

  def resourceId
      @resourceId = self.bus_id
  end	

end
