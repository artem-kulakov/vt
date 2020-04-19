# frozen_string_literal: true

class Checkup < ApplicationRecord
  belongs_to :bus

  enum category: { 'preventivo' => 0, 'correctivo' => 1, 'regular' => 2, 'reparacio' => 3 }
end
