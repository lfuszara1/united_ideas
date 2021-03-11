class IntAttributesController < ApplicationController

  def show
    @category = Category.find(params[:category_id])
    @child_categories = Category.childs(@category)
    if !@category.category_id.nil?
      @category_back = Category.find(@category.category_id)
    else
      @category_back = Category.find(1)
    end
    @parameter = Parameter.find(params[:parameter_id])
    @int_attribute = IntAttribute.find(params[:id])
  end

  def new
    @category = Category.find(params[:category_id])
    @parameter = Parameter.find(params[:parameter_id])
    @int_attribute = IntAttribute.new
  end

  def create
    @category = Category.find(params[:category_id])
    @parameter = Parameter.find(params[:parameter_id])
    @int_attribute = IntAttribute.create(parameter_params)

    redirect_to category_parameter_int_attribute_path(@category, @parameter, @int_attribute.id)
  end

  def edit
    @category = Category.find(params[:category_id])
    @parameter = Parameter.find(params[:parameter_id])
    @int_attribute = IntAttribute.find(params[:id])
  end

  def update
    @category = Category.find(params[:category_id])

    @parameter = Parameter.find(params[:parameter_id])

    @int_attribute = IntAttribute.find(params[:id])
    @int_attribute.update(parameter_params)

    redirect_to category_parameter_path(@category, @parameter)
  end

  def destroy
    @category = Category.find(params[:category_id])

    @parameter = IntAttribute.find(params[:id])
    @parameter.destroy

    redirect_to category_parameters_path(@category, @parameter)
  end

  private

  def parameter_params
    params.require(:int_attribute).permit(:parameter_id, :value)
  end

end
