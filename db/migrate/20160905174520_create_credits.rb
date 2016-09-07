class CreateCredits < ActiveRecord::Migration
  def change
    create_table :credits do |t|
      t.string :subject
      t.boolean :value, :default => false
      t.string :data
      t.references :semester
    end
  end
end
