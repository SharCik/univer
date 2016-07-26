class AddMagistracyTobids < ActiveRecord::Migration
  def change
    add_column :bids, :magistracy_id, :integer
  end
end
