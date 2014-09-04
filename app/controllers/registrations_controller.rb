class RegistrationsController < Devise::RegistrationsController

  def account_update_params
    params.require(:user).permit(:email, :password, :password_confirmation, :current_password, 
                                 :gamertag, :name, :role, :occupation, :fave_game, :game_addiction, 
                                 :fave_character, :first_fps, :fave_movie, :hobbies, :fact, :twitter, 
                                 :youtube, :twitch, :avatar, :avatar_file_name, :avatar_file_size,
                                 :avatar_content_type, :avatar_updated_at, :featured_vid)    
  end
end
