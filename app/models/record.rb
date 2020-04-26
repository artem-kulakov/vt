class Record < ActiveRecord::Base
  belongs_to :client
  belongs_to :user
  has_many :services, dependent: :destroy
  has_many :buses, through: :services
  has_many :payments, dependent: :destroy
  has_many :routes, dependent: :destroy

  enum status: %w(Abierto Cliente Itinerario Adicional Autobuses Precios Pagos Cerrado)

  def sum_payments
    payments.count == 0 ? 0 : payments.sum(:cantidad).round(2)
  end

  def sum_deuda
    self.precio_final == 0 ? 0 : precio_final - sum_payments.round(2)
  end

  def sum_1
  	self.start_time.present? ? 5.8 : 0
  end

  def sum_2
  	self.end_time.present? ? 5.8 : 0
  end

  def sum_3
  	self.initial_time.present? ? 5.8 : 0
  end

  def sum_4
  	self.finish_time.present? ? 5.8 : 0
  end

  def sum_5
  	self.numero_pasajeros.present? ? 5.8 : 0
  end

  def sum_6
  	self.numero_de_camiones.present? ? 5.8 : 0
  end

  def sum_7
  	self.lugar_salida.present? ? 5.8 : 0
  end

  def sum_8
  	self.referencia_salida.present? ? 5.8 : 0
  end

  def sum_9
  	self.num_factura.present? ? 5.8 : 0
  end

  def sum_10
  	self.precio.present? ? 5.8 : 0
  end

  def sum_11
  	self.precio_final.present? ? 6.5 : 0
  end

  def sum_12
  	self.services.present? ? 6.5 : 0
  end

  def sum_13
  	self.distancia.present? ? 5.8 : 0
  end

  def sum_14
  	self.routes.present? ? 5.8 : 0
  end

  def sum_15
  	self.client_id.present? ? 5.8 : 0
  end

  def sum_16
  	self.nombre_referencia.present? ? 5.8 : 0
  end

  def sum_17
  	self.telefono_referencia.present? ? 5.8 : 0
  end

  def sum_total
  	@sum_total = (sum_1+sum_2+sum_3+sum_4+sum_5+sum_6+sum_7+sum_8+sum_9+sum_10+sum_11+sum_12+sum_13+sum_14+sum_15+sum_16+sum_17).round(2)
  end

  def color
    if self.status_op == "Prob Baja" ; '#D61212' elsif self.status_op == "Prob Media" ; '#D6D612' elsif self.status_op == "Prob Alta" ; '#5AD612' elsif self.status_op == "Venta" ; '#1237D6' end
      
  end



end
