class AppointmentBookingService
  class Result
    attr_reader :success, :appointment, :errors

    def initialize(success:, appointment: nil, errors: [])
      @success = success
      @appointment = appointment
      @errors = Array(errors)
    end

    def success?
      @success
    end
  end

  def initialize(doctor:, patient:, appointment_time:)
    @doctor = doctor
    @patient = patient
    @appointment_time = appointment_time
  end

  def call
    appointment = Appointment.new(doctor: @doctor, patient: @patient, appointment_time: @appointment_time, status: :booked)

    if appointment.save
      Result.new(success: true, appointment: appointment)
    else
      Result.new(success: false, errors: appointment.errors.full_messages)
    end
  end
end
