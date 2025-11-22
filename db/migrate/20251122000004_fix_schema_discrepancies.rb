class FixSchemaDiscrepancies < ActiveRecord::Migration[8.0]
  def change
    # Rename id_number to identity_number in patients
    rename_column :patients, :id_number, :identity_number
    
    # Change status from integer to string in appointments
    change_column :appointments, :status, :string
  end
end
