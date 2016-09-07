class CreateDiffCredits < ActiveRecord::Migration
  def change
    create_table :diff_credits do |t|
      t.string :subject
      t.integer :value
      t.string :data
      t.references :semester
      t.timestamps null: false
    end
  end
end
