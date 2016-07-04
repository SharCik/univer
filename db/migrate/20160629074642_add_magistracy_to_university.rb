class AddMagistracyToUniversity < ActiveRecord::Migration
  def change
    add_column :universities, :magistracy, :boolean
  end
end
