class ChangeYears < ActiveRecord::Migration
  def change
    change_column :specialties, :training_period, :string
    change_column :specialties, :training_period_zaochno, :string 
    change_column :magistracies, :training_period, :string
    change_column :magistracies, :training_period_zaochno, :string
  end
end
