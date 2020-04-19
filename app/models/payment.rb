# frozen_string_literal: true

class Payment < ApplicationRecord
  belongs_to :record
  belongs_to :user
end
