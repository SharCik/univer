class CreateBids < ActiveRecord::Migration
  def change
    create_table :bids do |t|
      t.string :name
      t.string :phone
      t.string :mail
      t.string :comment

      t.timestamps null: false
    end
  end
end
