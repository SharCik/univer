class AddRatingToUniversity < ActiveRecord::Migration
  def change
    add_column :universities, :rating, :integer
  end
end
