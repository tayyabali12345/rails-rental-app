# frozen_string_literal: true

class ApplicationController < ActionController::Base
  include Pundit
  before_action :authenticate_user!
  before_action :configure_permitted_parameters, if: :devise_controller?

  rescue_from ActiveRecord::RecordNotFound, with: :record_not_found
  rescue_from Pundit::NotAuthorizedError, with: :user_not_authorized

  private

    def user_not_authorized
      flash[:alert] = 'You are not authorized to perform this action.'
      redirect_to(request.referer || root_path)
    end

    def record_not_found
      flash[:alert] = 'The record you requested could not be found.'
      redirect_to(root_path)
    end

    def configure_permitted_parameters
      devise_parameter_sanitizer.permit(:sign_up,
                                        keys: %i[username email password password_confirmation user_type name])
      devise_parameter_sanitizer.permit(:account_update,
                                        keys: %i[username email password password_confirmation current_password
                                                 user_type name])
    end
end
