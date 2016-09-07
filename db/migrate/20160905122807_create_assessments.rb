class CreateAssessments < ActiveRecord::Migration
  def change
    create_table :assessments do |t|
      t.string :subject
      t.integer :value
      t.string :data
      t.references :semester
      t.references :student
    end
  end
end
