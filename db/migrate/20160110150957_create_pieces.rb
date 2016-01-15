class CreatePieces < ActiveRecord::Migration
  def change
    create_table :pieces do |t|
      t.string :designer
      t.string :description
      t.string :size
      t.string :color
      t.string :pattern
      t.string :material
      t.string :category
      t.string :sub_category
      t.string :location
      t.string :condition
      t.references :client, index: true, foreign_key: true

      t.timestamps null: false
    end
  end
end
