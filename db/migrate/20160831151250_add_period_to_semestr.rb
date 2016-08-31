class AddPeriodToSemestr < ActiveRecord::Migration
  def change
    add_column :semesters, :period, :string
  end
end
