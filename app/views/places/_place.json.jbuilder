# frozen_string_literal: true

json.extract! place, :id, :quotation_id, :user_id, :address, :latitude, :longitude, :created_at, :updated_at
json.url place_url(place, format: :json)
