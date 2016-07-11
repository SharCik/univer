class AddTrainingPeriodZaOchno < ActiveRecord::Migration
  def change
    add_column :specialties, :training_period_zaochno, :integer
    add_column :magistracies, :training_period_zaochno, :integer
  end
end
