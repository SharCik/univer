class AddReferencesToDepartament < ActiveRecord::Migration
  def change
    add_reference :departaments, :university, index: true, foreign_key: true
  end
end
