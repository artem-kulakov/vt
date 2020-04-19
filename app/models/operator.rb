# frozen_string_literal: true

class Operator < ApplicationRecord
  belongs_to :user
  has_one :company, through: :user
  has_many :buses, dependent: :destroy
  has_many :services, dependent: :destroy
  has_many :vouchers, dependent: :destroy
  has_many :reviews, dependent: :destroy
end
