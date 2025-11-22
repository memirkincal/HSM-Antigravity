class PatientsController < ApplicationController
  def index
    patients = Patient.all
    render_json(status: 'success', data: patients)
  end

  def show
    patient = Patient.find_by(id: params[:id])
    return render_json(status: 'error', error: 'Patient not found', http_status: :not_found) unless patient

    render_json(status: 'success', data: patient)
  end

  def create
    patient = Patient.new(patient_params)
    if patient.save
      render_json(status: 'success', data: patient, http_status: :created)
    else
      render_json(status: 'error', error: patient.errors.full_messages, http_status: :unprocessable_entity)
    end
  end

  private

  def patient_params
    params.require(:patient).permit(:name, :identity_number)
  end
end
