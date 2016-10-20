class ChangePenalties < ActiveRecord::Migration
  def change
    remove_column :penalties, :description, :text
    remove_column :penalties, :month_id, :integer
    add_column :penalties, :semester_id, :string
  end
end