class HashAttributesController < ApplicationController

  def show
    @category = Category.find(params[:category_id])
    @child_categories = Category.childs(@category)
    if !@category.category_id.nil?
      @category_back = Category.find(@category.category_id)
    else
      @category_back = Category.find(1)
    end

    @parameter = Parameter.find(params[:parameter_id])
    @hash_attribute = HashAttribute.find(params[:id])
    @hash_elements = HashElement.where(hash_attribute_id: @hash_attribute.id)
  end

  def new
    @category = Category.find(params[:category_id])
    @parameter = Parameter.find(params[:parameter_id])
    @hash_attribute = HashAttribute.new
  end

  def create
    @category = Category.find(params[:category_id])
    @parameter = Parameter.find(params[:parameter_id])
    @hash_attribute = HashAttribute.create(parameter_params)

    redirect_to new_category_parameter_hash_attribute_hash_element_path(@category, @parameter, @hash_attribute.id)
  end

  def edit
    @category = Category.find(params[:category_id])
    @parameter = Parameter.find(params[:parameter_id])
    @hash_attribute = HashAttribute.find(params[:id])
  end

  def update
    @category = Category.find(params[:category_id])

    @parameter = HashAttribute.find(params[:id])
    @parameter.update(parameter_params)

    redirect_to category_parameter_hash_attribute_path(@category, @parameter)
  end

  def destroy
    @category = Category.find(params[:category_id])

    @parameter = HashAttribute.find(params[:id])
    @parameter.destroy

    redirect_to category_parameter_hash_attribute_path(@category, @param)
  end

  private

  def parameter_params
    params.require(:hash_attribute).permit(:parameter_id)
  end

end
