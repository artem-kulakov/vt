class Checkup < ApplicationRecord
  belongs_to :bus

  enum category: %w(regular, preventivo, correctivo, reparacio)
end
