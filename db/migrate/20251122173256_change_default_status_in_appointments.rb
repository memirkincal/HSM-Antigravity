class ChangeDefaultStatusInAppointments < ActiveRecord::Migration[8.1]
  def change
    change_column_default :appointments, :status, from: "0", to: "booked"
  end
end
