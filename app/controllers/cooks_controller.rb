class CooksController < ApplicationController
  before_action :authenticate_user!
  before_action :set_user
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
      redirect_to user_cook_path(@user, @cook), notice: "Witamy nowego kucharza!"
    else
      render "new"
    end
  end

  def edit
  end

  def update
  end

  def destroy
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
      cook = @user.cook
      redirect_to user_cook_path(@user, cook), notice: "Jesteś już kucharzem!" if cook
    end
end