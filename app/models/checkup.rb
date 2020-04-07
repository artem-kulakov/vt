class Checkup < ApplicationRecord
  belongs_to :bus

  enum category: %w(preventivo correctivo regular reparacio)
end
