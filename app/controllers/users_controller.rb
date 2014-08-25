class UsersController < ApplicationController
  before_action :authenticate_user!
  before_action :correct_user,   only: [:edit, :update]  

  def index
    @users = User.all
  end

  def new
  	@user = User.new  	
  end

  def create
    @user = User.new(user_params)
    if @user.save
      sign_in @user	
      redirect_to @user
    else
      render 'new'
    end
  end    	

  def show
    @user = User.find(params[:id])  
  end

  def edit
    @user = User.find(params[:id])  
  end  

private

  def user_params
    params.require(:user).permit(:gamertag, :name, :email, :role, :occupation, :fave_game, :game_addiction, :fave_character, :first_fps, :fave_movie, :hobbies, :fact, :twitter)
  end

  def current_user=(user)
    @current_user = user
  end  

  def correct_user
    @user = User.find(params[:id])
    redirect_to(root_url) unless current_user?(@user)
  end

end  

