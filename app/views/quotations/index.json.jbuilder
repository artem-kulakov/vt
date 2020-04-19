# frozen_string_literal: true

json.array! @quotations, partial: 'quotations/quotation', as: :quotation
