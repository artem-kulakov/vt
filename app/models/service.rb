class Service < ActiveRecord::Base
  belongs_to :bus
  belongs_to :record
  belongs_to :user

  def sum_gastos
    (self.try(:hotel)+self.try(:caseta)+self.try(:viaticos)+self.try(:estacionamientos)+self.try(:lavadas)+self.try(:aeropuerto)+self.try(:diesel)+self.try(:otros)).round(2)
  end

  def resourceId
      @resourceId = self.try(:bus_id)
  end	

end
