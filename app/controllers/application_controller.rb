class ApplicationController < ActionController::Base
  # Prevent CSRF attacks by raising an exception.
  # For APIs, you may want to use :null_session instead.
  protect_from_forgery with: :exception
  before_action :authenticate_user!
  # before_action :determine_role
  before_action :configure_permitted_parameters, if: :devise_controller?

  protected

  def determine_role
    if current_user.student?
      redirect_to 'students'
    elsif current_user.professor?
      redirect_to 'professors'
    else
      redirect_to :new_user_session_path
    end
  end

  def configure_permitted_parameters
    devise_parameter_sanitizer.for(:sign_up)
    devise_parameter_sanitizer.for(:account_update)
  end
end
