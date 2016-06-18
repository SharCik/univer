class AddInitialCostToDepartaments < ActiveRecord::Migration
  def change
    add_column :departaments, :initial_cost, :integer
  end
end
