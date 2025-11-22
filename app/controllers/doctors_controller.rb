class DoctorsController < ApplicationController
  def index
    doctors = Doctor.all
    render_json(status: 'success', data: doctors)
  end

  def show
    doctor = Doctor.find_by(id: params[:id])
    return render_json(status: 'error', error: 'Doctor not found', http_status: :not_found) unless doctor

    render_json(status: 'success', data: doctor)
  end

  def create
    doctor = Doctor.new(doctor_params)
    if doctor.save
      render_json(status: 'success', data: doctor, http_status: :created)
    else
      render_json(status: 'error', error: doctor.errors.full_messages, http_status: :unprocessable_entity)
    end
  end

  private

  def doctor_params
    params.require(:doctor).permit(:name, :specialization)
  end
end
