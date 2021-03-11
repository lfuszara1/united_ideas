class DecimalAttributesController < ApplicationController

  def show
    @category = Category.find(params[:category_id])
    @child_categories = Category.childs(@category)
    if !@category.category_id.nil?
      @category_back = Category.find(@category.category_id)
    else
      @category_back = Category.find(1)
    end
    @parameter = Parameter.find(params[:parameter_id])
    @decimal_attribute = DecimalAttribute.find(params[:id])
  end

  def new
    @category = Category.find(params[:category_id])
    @parameter = Parameter.find(params[:parameter_id])
    @decimal_attribute = DecimalAttribute.new
  end

  def create
    @category = Category.find(params[:category_id])
    @parameter = Parameter.find(params[:parameter_id])
    @decimal_attribute = DecimalAttribute.create(parameter_params)

    redirect_to category_parameter_decimal_attribute_path(@category, @parameter, @decimal_attribute.id)
  end

  def edit
    @category = Category.find(params[:category_id])
    @parameter = Parameter.find(params[:parameter_id])
    @decimal_attribute = DecimalAttribute.find(params[:id])
  end

  def update
    @category = Category.find(params[:category_id])

    @parameter = Parameter.find(params[:parameter_id])

    @decimal_attribute = DecimalAttribute.find(params[:id])
    @decimal_attribute.update(parameter_params)

    redirect_to category_parameter_decimal_attribute_path(@category, @parameter)
  end

  def destroy
    @category = Category.find(params[:category_id])

    @parameter = DecimalAttribute.find(params[:id])
    @parameter.destroy

    redirect_to category_parameters_path(@category, @parameter)
  end

  private

  def parameter_params
    params.require(:decimal_attribute).permit(:parameter_id, :value)
  end

end
