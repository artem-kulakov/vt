class CreateCompanies < ActiveRecord::Migration[6.0]
  def change
    create_table :companies do |t|
      t.string :razon_social

      t.timestamps
    end
  end
end
