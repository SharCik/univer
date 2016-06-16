class CreateUniversities < ActiveRecord::Migration
  def change
    create_table :universities do |t|
      t.string :name
      t.string :short_name
      t.text :description
      t.string :image

      t.timestamps null: false
    end
  end
end
