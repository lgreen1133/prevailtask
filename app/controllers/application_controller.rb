class ApplicationController < ActionController::Base
  # Prevent CSRF attacks by raising an exception.
  # For APIs, you may want to use :null_session instead.
  protect_from_forgery with: :exception
  before_action :authenticate_user!
  # before_action :determine_role
  before_action :configure_permitted_parameters, if: :devise_controller?

  protected

  # def determine_role
  #   if current_user.student?
  #     redirect_to 'students/students'
  #   elsif current_user.professor?
  #     redirect_to 'professors/professors'
  #   else
  #     redirect_to :new_user_session_path
  #   end
  # end

  def configure_permitted_parameters
    devise_parameter_sanitizer.permit(:sign_up) { |u| u.permit(:first_name,:last_name, :date_of_birth, :email, :password, :role) }
    devise_parameter_sanitizer.permit(:account_update) { |u| u.permit(:first_name,:last_name, :date_of_birth, :email, :password, :role) }
  end
end
