class Quotation < ActiveRecord::Base
  belongs_to :user
  has_many :places, dependent: :destroy

  enum status: %w(Abierto Itinerario Distancia Precios Cerrado)
end
