class AddFieldsToStudent < ActiveRecord::Migration
  def change
    add_column :students, :age, :integer
    add_column :students, :country, :string
    add_column :students, :full_name, :string
    add_column :students, :avatar, :string
  end
end
