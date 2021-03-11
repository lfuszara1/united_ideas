class HashElementsController < ApplicationController

  def show
    @category = Category.find(params[:category_id])
    @child_categories = Category.childs(@category)
    if !@category.category_id.nil?
      @category_back = Category.find(@category.category_id)
    else
      @category_back = Category.find(1)
    end

    @parameter = Parameter.find(params[:parameter_id])
    @hash_attribute = HashAttribute.find(params[:hash_attribute_id])
    @hash_element = HashElement.find(params[:id])
    @hash_elements = HashElement.where(id: @hash_element.id)
  end

  def new
    @category = Category.find(params[:category_id])
    @parameter = Parameter.find(params[:parameter_id])
    @hash_attribute = HashAttribute.find(params[:hash_attribute_id])
    @hash_element = HashElement.new
  end

  def create
    @category = Category.find(params[:category_id])
    @parameter = Parameter.find(params[:parameter_id])
    @hash_attribute = HashAttribute.find(params[:hash_attribute_id])
    @hash_element = HashElement.create(parameter_params)
    @hash_elements = HashElement.where(hash_element_id: @hash_element.id)

    redirect_to category_parameter_hash_attribute_hash_element_path(@category, @parameter, @hash_attribute, @hash_element.id)
  end

  def edit
    @category = Category.find(params[:category_id])
    @parameter = Parameter.find(params[:parameter_id])
    @hash_attribute = HashAttribute.find(params[:hash_attribute_id])
    @hash_element = HashElement.find(params[:id])
  end

  def update
    @category = Category.find(params[:category_id])
    @parameter = Parameter.find(params[:parameter_id])
    @hash_attribute = HashAttribute.find(params[:hash_attribute_id])
    @hash_element = HashElement.find(params[:id])
    @hash_element.update(parameter_params)

    redirect_to category_parameter_hash_attribute_path(@category, @parameter, @hash_attribute.id)
  end

  def destroy
    @category = Category.find(params[:category_id])
    @parameter = Parameter.find(params[:parameter_id])

    @hash_element = HashElement.find(params[:id])
    @hash_element.destroy

    redirect_to category_parameters_path(@category, @parameter)
  end

  private

  def parameter_params
    params.require(:hash_element).permit(:hash_attribute_id, :value)
  end

end
