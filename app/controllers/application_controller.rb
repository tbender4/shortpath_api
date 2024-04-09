# frozen_string_literal: true

# Pundit handles JSON and HTML auth issue
class ApplicationController < ActionController::API
  include Pundit::Authorization

  rescue_from Pundit::NotAuthorizedError, with: :user_not_authorized

  private

  def user_not_authorized
    render json: { error: 'You are not authorized to perform this action.' }, status: :forbidden

    # Check if the request expects a JSON response
    # if request.format.json?
    # render json: { error: 'You are not authorized to perform this action.' }, status: :forbidden
    # else
    #   # Handle HTML requests or other formats
    #   flash[:alert] = 'You are not authorized to perform this action.'
    #   redirect_back(fallback_location: root_path)
    # end
  end
end
