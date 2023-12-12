class CategoriesController < ApplicationController
  def index
    @categories = Category.all.order(:id)
  end

  def show
    @category = Category.find(params[:id])
  end

  def new
  end

  def edit
  end

  def update
  end
end
