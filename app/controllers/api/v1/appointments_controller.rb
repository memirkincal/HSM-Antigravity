module Api
  module V1
    class AppointmentsController < ApplicationController
      def create
        appointment = Appointment.new(appointment_params)

        if appointment.save
          render json: { status: 'success', data: appointment }, status: :created
        else
          render json: { status: 'error', errors: appointment.errors.full_messages }, status: :unprocessable_entity
        end
      end

      private

      def appointment_params
        params.require(:appointment).permit(:doctor_id, :patient_id, :appointment_time)
      end
    end
  end
end
