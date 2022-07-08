class CategoriesController < ApplicationController
  def index
    @categories = current_user.groups
  end

  def new
    category = Group.new
    respond_to do |format|
      format.html { render :new, locals: { category: category } }
    end
  end

  def create
    category = current_user.groups.new(category_params)
    respond_to do |format|
      format.html do
        if category.save
          redirect_to categories_path, flash: { alert: 'Created successfully' }
        else
          render :new, locals: { category: category }, flash: { alert: 'Error occured' }
        end
      end
    end
  end

  private

  def category_params
    params.require(:category).permit(:name, :icon)
  end
end
