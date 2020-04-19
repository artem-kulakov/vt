# frozen_string_literal: true

class AddCheckupToBuses < ActiveRecord::Migration[6.0]
  def change
    add_column :buses, :status, :integer
    add_column :buses, :kms_servicio_preventivo, :float
    add_column :buses, :kms_servicio_correctivo, :float
  end
end
