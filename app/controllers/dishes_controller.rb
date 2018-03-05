class DishesController < ApplicationController
  before_action :authenticate_user!
  before_action :set_cook, only: %i[index new edit update destroy]
  before_action :set_dish, only: %i[show edit update destroy]

  def index
    if @cook.dishes.present?
      @cook_dishes = @cook.dishes
    else
      flash[:notice] = 'Kucharz nie ma żadnych dań'
    end
  end

  def new
    @dish = Dish.new
    @ingredients = Ingredient.all
  end

  def show
  end

  def create
    if current_user.cook?
      @dish = Dish.new(dish_params)
      ingredients = Ingredient.find(params[:dish][:ingredients])
      @dish.ingredients << ingredients
      if @dish.save
        redirect_to(controller: 'dashboard', action: 'index')
        flash[:notice] = 'Twoje danie zostało utworzone!'
      else
        render 'new'
      end
    else
      not_cook
    end
  end

  def edit
  end

  def update
    if @dish.update_attributes(dish_params)
      redirect_to cook_dish_path(current_user.cook, @dish)
    else
      render 'edit'
    end
  end

  def destroy
    @dish.destroy
    flash[:success] = 'Danie zostało usunięte'
    redirect_to action: 'index', cook_id: @cook.id
  end

  private

  def dish_params
    params.require(:dish).permit(:name, :description, :type_of_kitchen, :spicyness)
          .merge(cook_id: current_user.cook.id)
  end

  def not_cook
    redirect_to root_path, notice: 'Nie jesteś kucharzem, nie możesz tworzyć dań!'
  end

  def set_cook
    @cook = Cook.find(params[:cook_id])
  end

  def set_dish
    @dish = Dish.find(params[:id])
  end

  def correct_cook
    redirect_to root_path unless @cook == current_user.cook
  end
end
