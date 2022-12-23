class CategoriesController < ApplicationController
  before_action :authenticate_user!, except: :splash

  def index
    @categories = current_user.ordered_groups
  end

  def new
    @category = current_user
    group = Group.new
    respond_to do |format|
      format.html { render :new, locals: { group: } }
    end
  end

  def create
    category = Group.new(category_params)
    category.user = current_user
    respond_to do |format|
      format.html do
        if category.save
          flash[:notice] = 'Category was successfully created.'
          redirect_to categories_path
        else
          flash[:alert] = 'Category was not created.'
          render :new, locals: { group: category }
        end
      end
    end
  end

  private

  def category_params
    params.require(:group).permit(:name, :icon)
  end
end
