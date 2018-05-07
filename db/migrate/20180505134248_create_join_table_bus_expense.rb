class CreateJoinTableBusExpense < ActiveRecord::Migration
  def change
    create_join_table :buses, :expenses do |t|
      # t.index [:bus_id, :expense_id]
      # t.index [:expense_id, :bus_id]
    end
  end
end
