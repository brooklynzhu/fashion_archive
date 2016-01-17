class CreatePickups < ActiveRecord::Migration
  def change
    create_table :pickups do |t|
      t.string :date
      t.string :notes
      t.references :client, index: true, foreign_key: true

      t.timestamps null: false
    end
  end
end
