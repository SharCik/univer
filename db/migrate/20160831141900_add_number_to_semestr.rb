class AddNumberToSemestr < ActiveRecord::Migration
  def change
    add_column :semesters, :number, :integer
  end
end
