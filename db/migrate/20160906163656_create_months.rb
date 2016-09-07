class CreateMonths < ActiveRecord::Migration
  def change
    create_table :months do |t|
      t.string :name
      t.references :semester
      t.timestamps null: true
    end
  end
end
