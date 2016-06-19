class AddColumnsToUniversity < ActiveRecord::Migration
  def change
    add_column :universities, :address, :string
    add_column :universities, :preparatory_department, :boolean
    add_column :universities, :hostel, :boolean
  end
end
