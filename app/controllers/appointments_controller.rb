class AppointmentsController < ApplicationController
  def index
    appointments = Appointment.all
    render_json(status: 'success', data: appointments)
  end

  def show
    appointment = Appointment.find_by(id: params[:id])
    return render_json(status: 'error', error: 'Appointment not found', http_status: :not_found) unless appointment

    render_json(status: 'success', data: appointment)
  end

  def create
    doctor = Doctor.find_by(id: appointment_params[:doctor_id])
    return render_json(status: 'error', error: 'Doctor not found', http_status: :not_found) unless doctor

    patient = Patient.find_by(id: appointment_params[:patient_id])
    return render_json(status: 'error', error: 'Patient not found', http_status: :not_found) unless patient

    appointment_time = appointment_params[:appointment_time]

    result = AppointmentBookingService.new(doctor: doctor, patient: patient, appointment_time: appointment_time).call

    if result.success?
      render_json(status: 'success', data: result.appointment, http_status: :created)
    else
      render_json(status: 'error', error: result.errors, http_status: :unprocessable_entity)
    end
  end

  def update
    appointment = Appointment.find_by(id: params[:id])
    return render_json(status: 'error', error: 'Appointment not found', http_status: :not_found) unless appointment

    if appointment.update(update_params)
      render_json(status: 'success', data: appointment)
    else
      render_json(status: 'error', error: appointment.errors.full_messages, http_status: :unprocessable_entity)
    end
  end

  def destroy
    appointment = Appointment.find_by(id: params[:id])
    return render_json(status: 'error', error: 'Appointment not found', http_status: :not_found) unless appointment

    appointment.destroy
    render_json(status: 'success', data: { message: 'Appointment deleted' })
  end

  private

  def appointment_params
    params.require(:appointment).permit(:doctor_id, :patient_id, :appointment_time)
  end

  def update_params
    params.require(:appointment).permit(:status, :appointment_time)
  end
end
