class AddColumnsToSpecialties < ActiveRecord::Migration
  def change
    add_column :specialties, :profession, :string
    add_column :specialties, :study_mode, :string
    add_column :specialties, :training_period, :integer
    add_column :specialties, :initial_cost, :integer
  end
end
