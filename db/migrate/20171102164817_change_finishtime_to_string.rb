class ChangeFinishtimeToString < ActiveRecord::Migration
  def change
  	change_column :records, :finish_time, :string
  end
end
