class IngredientsController < ApplicationController
  before_action :authenticate_user!
  before_action :set_ingredient, only: [:show, :edit, :update, :destroy]

  def index
    @ingredients = Ingredient.all
  end

  def new
    @ingredient_kinds = Ingredient.kinds.keys.to_a
    @ingredient = Ingredient.new
  end

  def show
  end

  def edit
  end

  def create
    @ingredient = Ingredient.new(ingredient_params)
    if @ingredient.save
      redirect_to @ingredient
    else
      render 'new'
    end
  end

  def update
    if @ingredient.update_attributes(ingredient_params)
      redirect_to @ingredient
    else
      render 'edit'
    end
  end

  def destroy
    @ingredient.destroy
    flash[:success] = 'Składnik został usunięty'
    redirect_to action: 'index'
  end

  private

  def ingredient_params
    params.require(:ingredient).permit(:name, :kind)
  end

  def set_ingredient
    @ingredient = Ingredient.find(params[:id])
  end
end
