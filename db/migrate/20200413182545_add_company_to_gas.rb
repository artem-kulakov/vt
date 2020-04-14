class AddCompanyToGas < ActiveRecord::Migration[6.0]
  def change
    add_reference :gas, :company, foreign_key: true
  end
end
