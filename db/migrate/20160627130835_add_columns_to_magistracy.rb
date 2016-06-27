class AddColumnsToMagistracy < ActiveRecord::Migration
  def change
    add_column :magistracies, :name, :string
    add_column :magistracies, :profession, :string
    add_column :magistracies, :training_period, :integer
    add_column :magistracies, :ochno, :boolean
    add_column :magistracies, :zaochno, :boolean
    add_column :magistracies, :ochno_price, :integer
    add_column :magistracies, :zaochno_price, :integer
    add_reference :magistracies, :departament, index: true, foreign_key: true
  end
end
