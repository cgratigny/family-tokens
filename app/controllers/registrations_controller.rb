class RegistrationsController < Devise::RegistrationsController
  prepend_before_action :configure_permitted_parameters, only: :create

  private

  def configure_permitted_parameters
    devise_parameter_sanitizer.permit(:sign_up, keys: [:first_name, :last_name])
  end
end
