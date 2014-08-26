class ApplicationController < ActionController::Base
  # Prevent CSRF attacks by raising an exception.
  # For APIs, you may want to use :null_session instead.
  before_filter :configure_permitted_parameters, if: :devise_controller?
  protect_from_forgery with: :exception
  protected

  def configure_permitted_parameters
    devise_parameter_sanitizer.for(:sign_up) { |u| u.permit(:gamertag, :email, :password, :password_confirmation) }

    devise_parameter_sanitizer.for(:account_update) do |u|
      u.permit(:email, :password, :password_confirmation, :current_password, 
                                 :gamertag, :name, :role, :occupation, :fave_game, :game_addiction, 
                                 :fave_character, :first_fps, :fave_movie, :hobbies, :fact, :twitter, 
                                 :youtube, :twitch)
    end
  end 
end
