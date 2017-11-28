class ApplicationController < ActionController::Base

  protect_from_forgery with: :exception

  before_action :configure_permitted_parameters, if: :devise_controller?
  include Pundit

  # Pundit: white-list approach.
  after_action :verify_authorized, except: :index, unless: :skip_pundit?
  after_action :verify_policy_scoped, only: :index, unless: :skip_pundit?

  def pundit_user
    current_chef || current_restaurant
  end

  protected

  def configure_permitted_parameters
    devise_parameter_sanitizer.permit(:sign_up, keys: [:email])
  end

  private

  def skip_pundit?
    devise_controller? || params[:controller] =~ /(^(rails_)?admin)/
  end


  def authenticate_someone!
    unless current_chef || current_restaurant
      redirect_to root_path, alert: "You need to sign in for that!"
    end
  end
end
