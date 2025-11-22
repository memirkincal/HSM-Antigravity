class ApplicationController < ActionController::API
	private

	def render_json(status:, data: nil, error: nil, http_status: :ok)
		payload = { status: status }
		payload[:data] = data if data.present?
		payload[:error] = error if error.present?
		render json: payload, status: http_status
	end
end
