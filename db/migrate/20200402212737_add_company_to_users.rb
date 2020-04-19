# frozen_string_literal: true

class AddCompanyToUsers < ActiveRecord::Migration[6.0]
  def change
    add_reference :users, :company, foreign_key: true
  end
end
