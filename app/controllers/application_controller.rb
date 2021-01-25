class ApplicationController < ActionController::Base
  before_action :configure_permitted_parameters, if: :devise_controller?

  protected

  def configure_permitted_parameters
    devise_parameter_sanitizer.permit(:sign_up, keys: [:name])
  end

  def after_sign_in_path_for(resource)
    case resource
    when Admin
      admin_path
    when EndUser
      root_path
    end
  end

  def after_sign_out_path_for(resource)
    case resource
    when EndUser, :end_user, :end_users
      root_path
    when Admin, :admin, :admins
      new_admin_session_path
    end
  end
end
