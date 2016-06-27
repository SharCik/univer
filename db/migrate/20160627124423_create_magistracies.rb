class CreateMagistracies < ActiveRecord::Migration
  def change
    create_table :magistracies do |t|

      t.timestamps null: false
    end
  end
end
