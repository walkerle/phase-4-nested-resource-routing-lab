class ApplicationController < ActionController::API
  rescue_from ActiveRecord::RecordNotFound, with: :render_not_found_response
  # rescue_from ActiveRecord::RecordInvalid, with: :record_invalid

  private

  def render_not_found_response exception
    render json: {error: "#{exception.model} not found"}, status: :not_found
  end

  # def record_invalid exception
  #   render json: {errors: exception.record.errors.full_messages}, status: :unprocessable_entity
  # end

end
