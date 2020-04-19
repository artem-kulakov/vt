# frozen_string_literal: true
class Record < ApplicationRecord
  belongs_to :client
  belongs_to :user
  has_many :services, dependent: :destroy
  has_many :buses, through: :services
  has_many :payments, dependent: :destroy
  has_many :routes, dependent: :destroy

  enum status: %w[Abierto Cliente Itinerario Adicional Autobuses Precios Pagos Cerrado]

  def sum_payments
    payments.count == 0 ? 0 : payments.sum(:cantidad).round(2)
  end

  def sum_deuda
    precio_final == 0 ? 0 : precio_final - sum_payments.round(2)
  end

  def sum_1
     start_time.present? ? 5.8 : 0
  end

  def sum_2
     end_time.present? ? 5.8 : 0
  end

  def sum_3
     initial_time.present? ? 5.8 : 0
  end

  def sum_4
     finish_time.present? ? 5.8 : 0
  end

  def sum_5
     numero_pasajeros.present? ? 5.8 : 0
  end

  def sum_6
     numero_de_camiones.present? ? 5.8 : 0
  end

  def sum_7
     lugar_salida.present? ? 5.8 : 0
  end

  def sum_8
     referencia_salida.present? ? 5.8 : 0
  end

  def sum_9
     num_factura.present? ? 5.8 : 0
  end

  def sum_10
     precio.present? ? 5.8 : 0
  end

  def sum_11
     precio_final.present? ? 6.5 : 0
  end

  def sum_12
     services.present? ? 6.5 : 0
  end

  def sum_13
     distancia.present? ? 5.8 : 0
  end

  def sum_14
     routes.present? ? 5.8 : 0
  end

  def sum_15
     client_id.present? ? 5.8 : 0
  end

  def sum_16
     nombre_referencia.present? ? 5.8 : 0
  end

  def sum_17
     telefono_referencia.present? ? 5.8 : 0
  end

  def sum_total
     @sum_total = (sum_1 + sum_2 + sum_3 + sum_4 + sum_5 + sum_6 + sum_7 + sum_8 + sum_9 + sum_10 + sum_11 + sum_12 + sum_13 + sum_14 + sum_15 + sum_16 + sum_17).round(2)
  end

  def color
    if self.status_op == "Prob Baja" ; '#D61212' elsif self.status_op == "Prob Media" ; '#D6D612' elsif self.status_op == "Prob Alta" ; '#5AD612' elsif self.status_op == "Venta" ; '#1237D6' end
  end

  def client_id
    client.try(:razon_social)
  end

  def client_id=(razon_social)
    if razon_social.present?
      self.client = Client.find_by_razon_social(razon_social)
    end
  end

end
