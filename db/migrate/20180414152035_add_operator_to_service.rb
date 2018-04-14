class AddOperatorToService < ActiveRecord::Migration
  def change
    add_reference :services, :operator, index: true, foreign_key: true
  end
end
