class CreateNews < ActiveRecord::Migration
  def change
    create_table :news do |t|
      t.string :name
      t.text :description
      t.string :news_image

      t.timestamps null: false
    end
  end
end
