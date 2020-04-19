# frozen_string_literal: true

class Bus < ApplicationRecord
  belongs_to :user
  belongs_to :operator
  has_many :services, dependent: :destroy
  has_many :vouchers, dependent: :destroy
  has_many :records, through: :services
  has_many :receipts, dependent: :destroy
  has_many :checkups, dependent: :destroy

  def kms_servicio_preventivo
    self[:kms_servicio_preventivo] || 0
  end

  def kms_servicio_correctivo
    self[:kms_servicio_correctivo] || 0
  end
end
