class AddReferencesToUniversity < ActiveRecord::Migration
  def change
    add_reference :universities, :city, index: true, foreign_key: true
  end
end
