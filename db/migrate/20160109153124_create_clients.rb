class CreateClients < ActiveRecord::Migration
  def change
    create_table :clients do |t|
      t.string :name
      t.string :birthday
      t.string :email
      t.string :email_assist
      t.string :cell_phone
      t.string :delivery_pref
      t.string :photo
      t.references :collection_manager, index: true, foreign_key: true

      t.timestamps null: false
    end
  end
end
