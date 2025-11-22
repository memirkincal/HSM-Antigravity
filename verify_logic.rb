# Create test data
doctor = Doctor.create!(name: 'Dr. House', specialization: 'Diagnostic')
patient = Patient.create!(name: 'John Doe', identity_number: '12345')

puts "Created Doctor: #{doctor.name}"
puts "Created Patient: #{patient.name}"

# Test 1: Book an appointment
time = Time.now + 1.day
appointment1 = Appointment.new(doctor: doctor, patient: patient, appointment_time: time)

if appointment1.save
  puts "Test 1 Passed: Appointment booked successfully. Status: #{appointment1.status}"
else
  puts "Test 1 Failed: #{appointment1.errors.full_messages.join(', ')}"
end

# Test 2: Try to book overlapping appointment
appointment2 = Appointment.new(doctor: doctor, patient: patient, appointment_time: time)

if appointment2.save
  puts "Test 2 Failed: Overlapping appointment was saved."
else
  puts "Test 2 Passed: Overlapping appointment rejected. Errors: #{appointment2.errors.full_messages.join(', ')}"
end
