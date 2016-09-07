class CreateOmissions < ActiveRecord::Migration
  def change
    create_table :omissions do |t|
      t.integer :hours
      t.references :month
      t.timestamps null: true
    end
  end
end
