class CreateDeliveries < ActiveRecord::Migration
  def change
    create_table :deliveries do |t|
      t.string :date
      t.string :notes
      t.references :client, index: true, foreign_key: true

      t.timestamps null: false
    end
  end
end
