class ChangePenaltiesPreferencers < ActiveRecord::Migration
  def change
    remove_column :penalties, :semester_id, :string
    add_column :penalties, :semester_id, :integer
  end
end
