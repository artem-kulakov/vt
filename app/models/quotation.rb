# frozen_string_literal: true

class Quotation < ApplicationRecord
  belongs_to :user
  has_many :places, dependent: :destroy

  enum status: { 'Abierto' => 0, 'Itinerario' => 1, 'Distancia' => 2, 'Precios' => 3, 'Cerrado' => 4 }
end
