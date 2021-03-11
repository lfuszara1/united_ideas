class ParametersController < ApplicationController

  def index
    @category = Category.find(params[:category_id])
    @child_categories = Category.childs(@category)
    if !@category.category_id.nil?
      @category_back = Category.find(@category.category_id)
    else
      @category_back = Category.find(1)
    end
    @parameters = Parameter.where(category_id: params[:category_id])

    @attributes = []
    @parameters.each do |parameter|
      case parameter.field_type
      when 1
        @attributes << [parameter, DecimalAttribute.where(parameter_id: params[:parameter_id])]
      when 2
        @attributes << [parameter, IntAttribute.where(parameter_id: params[:parameter_id])]
      when 3
        @attributes << [parameter, StringAttribute.where(parameter_id: params[:parameter_id])]
      when 4
        attributes = HashAttribute.where(parameter_id: params[:parameter_id])
        array_elements = []
        attributes.each do |attribute|
          array_elements << [attribute, HashElement.where(hash_id: attribute.id)]
        end
        @attributes << [parameter, array_elements]
      end
    end
  end

  def show
    @category = Category.find(params[:category_id])
    @child_categories = Category.childs(@category)
    if !@category.category_id.nil?
      @category_back = Category.find(@category.category_id)
    else
      @category_back = Category.find(1)
    end
    @parameter = Parameter.find(params[:id])

    case @parameter.field_type
    when 1
      @attribute = DecimalAttribute.where(parameter_id: @parameter.id)
    when 2
      @attribute = IntAttribute.where(parameter_id: @parameter.id)
    when 3
      @attribute = StringAttribute.where(parameter_id: @parameter.id)
    when 4
      @hash_attribute = HashAttribute.where(parameter_id: @parameter.id)
      @attribute = []
      @hash_attribute.each do |attribute|
        @attribute << HashElement.where(hash_attribute_id: attribute.id)
      end
    end
  end

  def new
    @category = Category.find(params[:category_id])
    @parameter = Parameter.new
  end

  def create
    @category = Category.find(params[:category_id])
    @parameter = Parameter.create(parameter_params)

    redirect_to category_parameters_path(@category, @parameter.id)
  end

  def edit
    @category = Category.find(params[:category_id])
    @parameter = Parameter.find(params[:id])
  end

  def update
    @category = Category.find(params[:category_id])
    @parameter = Parameter.find(params[:id])
    @parameter.update(parameter_params)

    redirect_to category_parameter_path(@category, @parameter)
  end

  def destroy
    @category = Category.find(params[:category_id])

    @parameter = Parameter.find(params[:id])
    @parameter.destroy

    redirect_to category_parameters_path(@category, @param)
  end

  private

  def parameter_params
    params.require(:parameter).permit(:category_id, :name, :field_type, :searchable?)
  end

end
