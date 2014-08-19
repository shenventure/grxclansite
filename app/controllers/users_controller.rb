class UsersController < ApplicationController
  before_action :authenticate_user!

  def index
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

end
