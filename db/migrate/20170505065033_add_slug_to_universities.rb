class AddSlugToUniversities < ActiveRecord::Migration
  def change
    add_column :universities, :univer_url, :string
    add_column :universities, :slug, :string
    add_index :universities, :slug, unique: true
  end
end
