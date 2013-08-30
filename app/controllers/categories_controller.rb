class CategoriesController < ApplicationController
  before_filter :authenticate_user!, except: :show
  before_action :set_category, only: [:show, :edit, :update, :destroy]
  authorize_resource

  def index
    @categories = Category.all
  end

  def new
    @category = Category.new
  end

  def edit
  end

  def show
    @links = Link.eager_load(:category, :user).order(created_at: :desc).where(category: @category)
    @categories = Category.order(name: :asc).all
  end

  def create
    @category = Category.new(category_params)

    respond_to do |format|
      if @category.save
        format.html { redirect_to categories_path, notice: t('.success') }
      else
        format.html { render action: 'new' }
      end
    end
  end

  def update
    respond_to do |format|
      if @category.update(category_params)
        format.html { redirect_to categories_path, notice: t('.success') }
      else
        format.html { render action: 'edit' }
      end
    end
  end

  def destroy
    @category.destroy
    respond_to do |format|
      format.html { redirect_to categories_url }
    end
  end

  private
    def set_category
      @category = Category.find(params[:id])
    end

    def category_params
      params.require(:category).permit(:name, :color)
    end
end
