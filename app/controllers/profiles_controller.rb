  class ProfilesController < ApplicationController

  def index
  end

  def new
    @user = current_user
    @profile = Profile.new
  end

  def create
    if user_signed_in?
      @user = current_user
      @profile = current_user.build_profile(params[:profile])
      if @profile.save
        flash[:success] = "Profile created!"
        redirect_to @profile
      else
        flash[:error] = "Please complete your profile."
        # render new_profile_path(@profile)
      end    
    else
      flash[:success] = "else"
      # redirect_to profiles_path
    end    
  end

  def show
    @user = current_user
    @profile = Profile.find(params[:id])    
  end

  def edit
    @profile = Profile.find(params[current_user.id])
  end

  def update
  end

  def destroy
  end

private

  def correct_user
    @profile = current_user.profiles.find_by(id: params[:id])
    redirect_to root_url unless current_user?(@profile.user)
  end

  def profile_params
      # It's mandatory to specify the nested attributes that should be whitelisted.
      # If you use `permit` with just the key that points to the nested attributes hash,
      # it will return an empty hash.
    params.require(:profile).permit(:name, :role, :occupation)
  end

end
