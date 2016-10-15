class ChangeStudent < ActiveRecord::Migration
  def change
    remove_column :students, :age, :integer
    add_column :students, :birthday, :string
    add_column :students, :rating, :string
  end
end
