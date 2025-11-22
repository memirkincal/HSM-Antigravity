class CreatePatients < ActiveRecord::Migration[7.0]
  def change
    create_table :patients do |t|
      t.string :name, null: false
      t.string :id_number, null: false

      t.timestamps
    end
    add_index :patients, :id_number, unique: true
  end
end
