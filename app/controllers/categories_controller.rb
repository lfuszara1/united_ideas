class CategoriesController < ApplicationController

  def index
    @category = Category.find(1)
    @child_categories = Category.childs(@category)
    if !@category.category_id.nil?
      @category_back = Category.find(@category.category_id)
    else
      @category_back = Category.find(1)
    end
    @categories = Category.all
  end

  def show
    @category = Category.find(params[:id])
    @child_categories = Category.childs(@category)
    if !@category.category_id.nil?
      @category_back = Category.find(@category.category_id)
    else
      @category_back = Category.find(1)
    end
  end

  def new
    categories = Category.all
    @categories = []
    categories.each do |category|
      @categories << [category.name, category.id]
    end
    @category = Category.new
  end

  def create
    Category.create(category_params)

    redirect_to categories_path
  end

  def edit
    categories = Category.all
    @categories = []
    categories.each do |category|
      @categories << [category.name, category.id]
    end
    @category = Category.find(params[:id])
  end

  def update
    @category = Category.find(params[:id])
    @category.update(category_params)

    redirect_to category_path(@category)
  end

  def destroy
    @category = Category.find(params[:id])
    @category.destroy

    redirect_to categories_path
  end

  private

  def category_params
    params.require(:category).permit(:category_id, :parameters_from, :name)
  end

end
