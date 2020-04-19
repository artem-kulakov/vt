# frozen_string_literal: true

class AddFieldsToCompany < ActiveRecord::Migration[6.0]
  def change
    add_column :companies, :industry, :string
    add_column :companies, :rfc, :string
    add_column :companies, :alias, :string
    add_column :companies, :company_type, :string
    add_column :companies, :cadena_verificacion, :string
    add_column :companies, :type_a_name, :string
    add_column :companies, :type_a_km_cost, :integer
    add_column :companies, :type_a_day_cost, :integer
    add_column :companies, :type_b_name, :string
    add_column :companies, :type_b_km_cost, :integer
    add_column :companies, :type_b_day_cost, :integer
    add_column :companies, :type_c_name, :string
    add_column :companies, :type_c_km_cost, :integer
    add_column :companies, :type_c_day_cost, :integer
    add_column :companies, :type_d_name, :string
    add_column :companies, :type_d_km_cost, :integer
    add_column :companies, :type_d_day_cost, :integer
  end
end
