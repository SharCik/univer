class AddReferenceSpecialtyToUser < ActiveRecord::Migration
  def change
    add_reference :students, :specialty, index: true, foreign_key: true
  end
end
