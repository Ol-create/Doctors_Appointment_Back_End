class ApplicationController < ActionController::API
  include RackSessionFixController

  before_action :configure_permitted_parameters, if: :devise_controller?

  private

  def configure_permitted_parameters
    keys = %i[name phone avatar]
    update_keys = keys + %i[remove_avatar]
    devise_parameter_sanitizer.permit(:sign_up, keys:)
    devise_parameter_sanitizer.permit(:account_update, keys: update_keys)
  end
end
