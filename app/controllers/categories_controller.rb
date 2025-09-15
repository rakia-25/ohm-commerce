class CategoriesController < ApplicationController

    def index
      @categories = Category.all
    end

    def new
      @category = Category.new
    end

    def create
      @category = Category.new(category_params)
      if @category.save
        redirect_to admin_categories_path, notice: "Catégorie créée"
      else
        render :new
      end
    end

    def edit
      @category = Category.find(params[:id])
    end

    def update
      @category = Category.find(params[:id])
      if @category.update(category_params)
        redirect_to admin_categories_path, notice: "Catégorie mise à jour"
      else
        render :edit
      end
    end

    def destroy
      @category = Category.find(params[:id])
      @category.destroy
      redirect_to admin_categories_path, notice: "Catégorie supprimée"
    end

    private

    def category_params
      params.require(:category).permit(:name, :slug)
    end
end
