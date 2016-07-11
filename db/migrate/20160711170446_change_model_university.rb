class ChangeModelUniversity < ActiveRecord::Migration
  def change
    add_column :universities, :ochno, :boolean
    add_column :universities, :zaochno, :boolean

    remove_column :departaments, :initial_cost, :integer
    remove_column :universities, :cost_ochno, :integer
    remove_column :universities, :cost_zaochno, :integer
  end
end
