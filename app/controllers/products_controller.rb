class ProductsController < ApplicationController

  def index
    @category = Category.find(params[:category_id])
    @child_categories = Category.childs(@category)
    if !@category.category_id.nil?
      @category_back = Category.find(@category.category_id)
    else
      @category_back = Category.find(1)
    end
    queue = []
    queue << @category.id
    @categories_ids = [@category.id]
    loop do
      element = queue.shift
      categories = Category.where(category_id: element)

      categories.each do |category|
        queue << category.id
        @categories_ids << category.id
      end unless categories.empty?

      break if queue.empty?
    end

    @products = Product.where(category_id: @categories_ids)
  end

  def show
    @category = Category.find(params[:category_id])

    @child_categories = Category.childs(@category)
    if !@category.category_id.nil?
      @category_back = Category.find(@category.category_id)
    else
      @category_back = Category.find(1)
    end
    @product = Product.find(params[:id])

    @categories_ids = [Category.find(params[:category_id].to_i).parameters_from]
    while @params_from.to_i > 1
      @categories_ids << Category.where(id: @categories_ids.last.parameters_from).last.category_id
    end

    @parameters = []
    @categories_ids.each do |id|
      category = Category.find(id)
      parameters = category.parameters.all
      parameters.each do |parameter|
        @parameters << parameter
      end
    end

    @attributes = []
    @parameters.each do |parameter|
      case parameter.field_type.to_i
      when 1
        @parameter_attribute = DecimalAttribute.where(parameter_id: parameter.id).last
        if @parameter_attribute.nil?
          @attributes << [parameter.name, 0.0]
        else
          @attributes << [parameter.name, @parameter_attribute.value]
        end
      when 2
        @parameter_attribute = IntAttribute.where(parameter_id: parameter.id).last
        if @parameter_attribute.nil?
          @attributes << [parameter.name, 0]
        else
          @attributes << [parameter.name, @parameter_attribute.value]
        end
      when 3
        @parameter_attribute = StringAttribute.where(parameter_id: parameter.id).last
        if @parameter_attribute.nil?
          @attributes << [parameter.name, ""]
        else
          @attributes << [parameter.name, @parameter_attribute.value]
        end
      when 4
        @parameter_attribute = HashAttribute.where(parameter_id: parameter.id).last
        if !@parameter_attribute.nil?
          @parameter_hash_attr = HashElement.where(hash_attribute_id: @parameter_attribute.id)
          @parameter_hash_attr.each do |hsh|
            @attributes << [parameter.name, hsh.value]
          end
        else
          @attributes << [parameter.name, ""]
        end
      end
    end
  end

  def new
    @category = Category.find(params[:category_id])
    @product = Product.new
  end

  def create
    @category = Category.find(params[:category_id])

    Product.create(product_params)

    redirect_to category_products_path(@category)
  end

  def show_params
    @category = Category.find(params[:category_id])
    @product = Product.find(params[:product_id])

    @categories_ids = [params[:category_id].to_i]
    while @categories_ids.last.to_i > 1
      @categories_ids << Category.where(id: @categories_ids.last).last.category_id
    end

    @parameters = []
    @categories_ids.each do |id|
      category = Category.find(id)
      parameters = category.parameters.all
      parameters.each do |parameter|
        @parameters << parameter
      end
    end
  end

  def new_param
    @field_type = params[:field_type]
    @category = Category.find(params[:category_id])
    @product = Product.find(params[:product_id])
    @parameter = Parameter.find(params[:parameter_id])
    case @field_type.to_i
    when 1
      @parameter_attribute = DecimalAttribute.new
    when 2
      @parameter_attribute = IntAttribute.new
    when 3
      @parameter_attribute = StringAttribute.new
    when 4
      @parameter_attribute = HashAttribute.new
    end
  end

  def create_param
    @category = Parameter.find(params[:category_id])
    @product = Product.find(params[:product_id])
    @parameter = Parameter.find(params[:parameter_id])

    case @parameter.field_type
    when 1
      @attribute_value = DecimalAttribute.find(params[:id])
      @attribute_value.update(decimal_parameter_params)

      redirect_to category_product_show_params_path_path(@category, @product)
    when 2
      @attribute_value = IntAttribute.find(params[:id])
      @attribute_value.update(int_parameter_params)

      redirect_to category_product_show_params_path_path(@category, @product)
    when 3
      @attribute_value = StringAttribute.find(params[:id])
      @attribute_value.update(string_parameter_params)

      redirect_to category_product_show_params_path_path(@category, @product)
    when 4
      @attribute_value = HashAttribute.find(params[:id])
      @attribute_value.update(hash_parameter_params)

      redirect_to edit_category_parameter_hash_attribute_hash_element_path(@category, @parameter, @attribute_value.id)
    end
  end

  def edit
    @category = Category.find(params[:category_id])
    parameters = Parameter.all
    @parameters = []
    parameters.each do |parameter|
      @parameters << [parameter.name, parameter.id]
    end
    @product = Product.find(params[:id])
  end

  def update
    @category = Category.find(params[:category_id])

    @product = Product.find(params[:id])
    @product.update(product_params)

    redirect_to category_product_path(@category, @product)
  end

  def destroy
    @category = Category.find(params[:category_id])

    @product = Product.find(params[:id])
    @product.destroy

    redirect_to category_products_path(@category)
  end

  private

  def product_params
    params.require(:product).permit(:category_id, :name, :price)
  end

  def decimal_parameter_params
    params.require(:decimal_attribute).permit(:parameter_id, :product_id, :value)
  end

  def int_parameter_params
    params.require(:int_attribute).permit(:parameter_id, :product_id, :value)
  end

  def string_parameter_params
    params.require(:string_attribute).permit(:parameter_id, :product_id, :value)
  end

  def hash_parameter_params
    params.require(:hash_attribute).permit(:parameter_id, :product_id, :value)
  end

end
