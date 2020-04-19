# frozen_string_literal: true

class Review < ApplicationRecord
  belongs_to :operator

  def year
    created_at.to_date.strftime('%G')
  end
end
