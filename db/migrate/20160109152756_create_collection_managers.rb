class CreateCollectionManagers < ActiveRecord::Migration
  def change
    create_table :collection_managers do |t|
      t.string :name

      t.timestamps null: false
    end
  end
end
