class Appointment < ApplicationRecord
  belongs_to :doctor
  belongs_to :patient

  # enum status: { booked: 0, completed: 1, cancelled: 2 } # Removed as per new requirement

  validates :appointment_time, presence: true
  validates :status, presence: true
  
  validate :doctor_must_be_available

  before_validation :set_default_status, on: :create

  private

  def set_default_status
    self.status ||= 'booked'
  end

  def doctor_must_be_available
    return unless doctor_id && appointment_time

    if Appointment.where(doctor_id: doctor_id, appointment_time: appointment_time).where.not(id: id).exists?
      errors.add(:appointment_time, 'is already booked for this doctor')
    end
  end
end
