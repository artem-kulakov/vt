# frozen_string_literal: true

json.array! @vouchers, partial: 'vouchers/voucher', as: :voucher
