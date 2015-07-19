class Admin::CategoriesController < Admin::ApplicationController
  def new
    @page_title = "Add Category"
    @category = Category.new
  end

  def create
    @category = Category.new(category_params)
    if @category.save
      flash[:notice] = "Category created"
      redirect_to admin_categories_path
    else
      render "new"
    end
  end

  def edit
    @category = Category.find_by(params[:id])
  end

  def update
    @category = Category.find_by(params[:id])
    if @category.update(category_params)
      flash[:notice] = "Category updated"
      redirect_to admin_categories_path
    else
      render "new"
    end
  end

  def destroy
    @category = Category.find_by(params[:id])
    @category.destroy
    flash[:danger] = "Category deleted"
    redirect_to admin_categories_path
  end

  def index
    @categories = Category.all
  end

  private

  def category_params
    params.require(:category).permit(:name)
  end
end
