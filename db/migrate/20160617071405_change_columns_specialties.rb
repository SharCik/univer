class ChangeColumnsSpecialties < ActiveRecord::Migration
  def change
    remove_column :specialties, :study_mode, :string
    remove_column :specialties, :initial_cost, :integer
    add_column :specialties, :ochno, :boolean
    add_column :specialties, :zaochno, :boolean
    add_column :specialties, :ochno_price, :integer
    add_column :specialties, :zaochno_price, :integer
  end
end
