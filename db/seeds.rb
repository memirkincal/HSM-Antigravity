# Clear existing data
puts "Clearing existing data..."
Appointment.destroy_all
Doctor.destroy_all
Patient.destroy_all

# Reset sequences to ensure IDs start from 1
ActiveRecord::Base.connection.reset_pk_sequence!('doctors')
ActiveRecord::Base.connection.reset_pk_sequence!('patients')
ActiveRecord::Base.connection.reset_pk_sequence!('appointments')

# Create Doctor with explicit ID
puts "Creating Doctor..."
doctor = Doctor.create!(
  id: 1,
  name: 'Dr. House',
  specialization: 'Internal'
)

# Create Patient with explicit ID
puts "Creating Patient..."
patient = Patient.create!(
  id: 1,
  name: 'Jane Doe',
  identity_number: '11122233344'
)

puts "Seed data created successfully!"
puts "Doctor: #{doctor.name} (ID: #{doctor.id})"
puts "Patient: #{patient.name} (ID: #{patient.id})"
