class CreatePenalties < ActiveRecord::Migration
  def change
    create_table :penalties do |t|
      t.string :title
      t.text :description
      t.string :data
      t.references :month
      t.timestamps null: true
    end
  end
end
