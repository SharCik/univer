class CreateQualifications < ActiveRecord::Migration
  def change
    create_table :qualifications do |t|
      t.string :name
      t.references :specialty, index: true, foreign_key: true

      t.timestamps null: false
    end
  end
end
