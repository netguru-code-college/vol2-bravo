class CooksController < ApplicationController
  before_action :authenticate_user!
  before_action :set_user, only: [:new, :create, :update]
  before_action :set_cook, only: [:show, :edit, :update, :destroy]
  before_action :is_cook_already?, only: [:new, :create]

  def show
  end

  def new
    @cook = Cook.new
  end

  def create
    @cook = Cook.new(cook_params)
    if @cook.save
      notice = "Witamy nowego kucharza!"
      redirect_to user_cook_path(@cook.user, @cook), notice: notice
    else
      render "new"
    end
  end

  def edit
  end

  def update
    if @cook.update_attributes(cook_params)
      notice = "Profil kucharza zaktualizowany!"
      redirect_to user_cook_path(@cook.user, @cook), notice: notice
    else
      render "edit"
    end
  end

  def destroy
    @cook.destroy
    notice = "Profil kucharza został usunięty!"
    redirect_to root_path, notice: notice
  end

  private

    def cook_params
      params.require(:cook).permit(:speciality, :work_city).merge(user_id: @user.id)
    end

    def set_user
      @user = User.find(params[:user_id])
    end

    def set_cook
      @cook = Cook.find(params[:id])
    end

    def is_cook_already?
      redirect_to user_cook_path(@user, cook) if @user.is_cook?
    end
end
