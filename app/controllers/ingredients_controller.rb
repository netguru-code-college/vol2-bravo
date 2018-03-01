class IngredientsController < ApplicationController
  before_action :authenticate_user!

  def index
    @ingredients = Ingredient.all
  end

  def new
    @ingredient_kinds = Ingredient.kinds.keys.to_a
    @ingredient = Ingredient.new
  end

  def show
    @ingredient = Ingredient.find(params[:id])
  end

  def edit
    @ingredient = Ingredient.find(params[:id])
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
    @ingredient = Ingredient.find(params[:id])
    if @ingredient.update_attributes(ingredient_params)
      redirect_to @ingredient
    else
      render 'edit'
    end
  end

  def destroy
    Ingredient.find(params[:id]).destroy
    flash[:success] = 'Składnik został usunięty'
    redirect_to action: 'index'
  end

  private

  def ingredient_params
    params.require(:ingredient).permit(:name, :kind)
  end
end
