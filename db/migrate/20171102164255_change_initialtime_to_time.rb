# frozen_string_literal: true

class ChangeInitialtimeToTime < ActiveRecord::Migration
  def change
    change_column :records, :initial_time, :string
  end
end
