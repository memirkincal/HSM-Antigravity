# Verify Core Logic

puts "Cleaning up..."
Appointment.destroy_all
Doctor.destroy_all
Patient.destroy_all

puts "Creating Doctor and Patient..."
doctor = Doctor.create!(name: "Dr. House", specialization: "Diagnostician")
patient = Patient.create!(name: "John Doe", identity_number: "12345678901")

puts "Creating First Appointment..."
t1 = Time.now + 1.day
a1 = Appointment.create!(doctor: doctor, patient: patient, appointment_time: t1)

puts "Appointment 1 Status: #{a1.status}"
if a1.status == 'booked'
  puts "SUCCESS: Default status is 'booked'"
else
  puts "FAILURE: Default status is '#{a1.status}'"
end

puts "Attempting to create conflicting appointment..."
a2 = Appointment.new(doctor: doctor, patient: patient, appointment_time: t1)

if a2.save
  puts "FAILURE: Conflicting appointment was saved!"
else
  puts "SUCCESS: Conflicting appointment failed validation."
  puts "Errors: #{a2.errors.full_messages}"
end

puts "Attempting to create non-conflicting appointment..."
a3 = Appointment.create!(doctor: doctor, patient: patient, appointment_time: t1 + 1.hour)
puts "SUCCESS: Non-conflicting appointment created."
