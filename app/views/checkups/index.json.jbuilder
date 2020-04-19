# frozen_string_literal: true

json.array! @checkups, partial: 'checkups/checkup', as: :checkup
