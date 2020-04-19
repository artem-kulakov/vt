# frozen_string_literal: true

class Route < ApplicationRecord
  belongs_to :record
  belongs_to :user
end
