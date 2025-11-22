class CreateAppointments < ActiveRecord::Migration[7.0]
  def change
    create_table :appointments do |t|
      t.references :doctor, null: false, foreign_key: true
      t.references :patient, null: false, foreign_key: true
      t.datetime :appointment_time, null: false
      t.integer :status, null: false, default: 0

      t.timestamps
    end

    add_index :appointments, [:doctor_id, :appointment_time], unique: true, name: 'index_appointments_on_doctor_and_time'
  end
end
