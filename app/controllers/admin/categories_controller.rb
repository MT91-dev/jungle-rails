class Admin::CategoriesController < ApplicationController
  http_basic_authenticate_with name: ENV["HTTP_BASIC_USER"],
  password: ENV["HTTP_BASIC_PASSWORD"]

  def index
    @categories = Category.all
  end

  def create
    @category = Category.new(params_category)
    if @category.save
      redirect_to [:admin, :categories], notice: 'Successfully created Category!'
    else
      render :new
    end
  end

  def new
    @category = Category.new
  end

  private

  def params_category
    params.require(:category).permit(:name)
  end

end