class UsersController < ApplicationController
  before_action :authenticate_user!
  before_action :set_user, only: [:edit, :update, :destroy]
  
  def edit
  end

  def update
    if @user.update_attributes(user_params)
      redirect_to root_path, notice: "Profil zaktualizowany!"
    else
      render 'edit'
    end
  end

  def destroy
    @user.destroy
    redirect_to new_user_registration_path, notice: "Profil został usunięty!"
  end

  private 

  def user_params
    params.require(:user).permit(:name, :last_name, :live_city, :interesting_city)
  end

  def set_user
    @user = User.find(params[:id])
  end
end
