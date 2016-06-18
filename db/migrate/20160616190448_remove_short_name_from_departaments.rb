class RemoveShortNameFromDepartaments < ActiveRecord::Migration
  def change
    remove_column :departaments, :short_name, :string
  end
end
