class RemoveBusIsFromExpense < ActiveRecord::Migration
  def change
    remove_reference :expenses, :bus, index: true, foreign_key: true
  end
end
