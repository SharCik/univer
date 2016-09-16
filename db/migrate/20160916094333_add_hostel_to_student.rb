class AddHostelToStudent < ActiveRecord::Migration
  def change
    add_column :students, :hostel, :boolean, default: false
  end
end
