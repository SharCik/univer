class AddReferencesToBid < ActiveRecord::Migration
  def change
    add_reference :bids, :city, index: true, foreign_key: true
    add_reference :bids, :university, index: true, foreign_key: true
    add_reference :bids, :departament, index: true, foreign_key: true
    add_reference :bids, :specialty, index: true, foreign_key: true
  end
end