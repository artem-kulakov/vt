class Service < ActiveRecord::Base
  belongs_to :bus
  belongs_to :record
  belongs_to :user

  def sum_gastos
    (self.hotel+self.caseta+self.viaticos+self.estacionamientos+self.lavadas+self.aeropuerto+self.diesel+self.otros).round(2)
  end

  def resourceId
      @resourceId = self.bus_id
  end	

end
