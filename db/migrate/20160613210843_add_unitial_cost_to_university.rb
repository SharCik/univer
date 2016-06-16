class AddUnitialCostToUniversity < ActiveRecord::Migration
  def change
    add_column :universities, :initial_cost, :integer
  end
end
