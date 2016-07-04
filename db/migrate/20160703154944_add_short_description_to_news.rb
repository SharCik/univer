class AddShortDescriptionToNews < ActiveRecord::Migration
  def change
    add_column :news, :short_description, :text
  end
end
