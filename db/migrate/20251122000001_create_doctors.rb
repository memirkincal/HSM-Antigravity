class CreateDoctors < ActiveRecord::Migration[7.0]
  def change
    create_table :doctors do |t|
      t.string :name, null: false
      t.string :specialization, null: false

      t.timestamps
    end
  end
end
