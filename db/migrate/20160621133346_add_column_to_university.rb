class AddColumnToUniversity < ActiveRecord::Migration
  def change
    add_column :universities, :cost_ochno, :integer
    add_column :universities, :cost_zaochno, :string
  end
end
