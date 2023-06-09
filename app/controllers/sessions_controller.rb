# frozen_string_literal: true

class SessionsController < Devise::SessionsController
  include RackSessionFix

  respond_to :json

  private

  # Override devise methods
  def respond_with(_resource, _opts = {})
    render json: {
        status: 200,
        message: 'logged in successfully',
        data: current_user
      }, status: :ok
  end

  def respond_to_on_destroy
    if all_signed_out?
      render json: {
        status: 200,
        message: 'logged out successfully'
      }, status: :ok
    else
      render json: {
    status: 401,
    message: "Couldn't find an active session."
  }, status: :unauthorized
    end
  end
end
