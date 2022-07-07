class CategoriesController < ApplicationController
  def index
    @categories = current_user.groups
  end

  def show
    @category = Group.find(params[:id])
  end
  
  def new
    category = Group.new
    respond_to do |format|
      format.html { render :new, locals: { category:category } }
    end
  end

  def create
    recipe = current_user.groups.new(category_params)
    respond_to do |format|
      format.html do
        if recipe.save
          flash[:notice] = 'Created Successfully'
          redirect_to categories_index_path
        else
          flash[:notice] = 'Error occcured, Please check values'
        end
      end
    end
  end

  private

  def category_params
    params.require(:category).permit(:name, :icon)
  end
end
