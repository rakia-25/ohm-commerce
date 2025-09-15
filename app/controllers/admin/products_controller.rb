class Admin::ProductsController < ApplicationController
    before_action :set_product, only: [:edit, :update, :destroy, :show]

    def index
      @products = Product.includes(:category).all
    end

    def show
      # @product déjà défini par set_product
    end

    def new
      @product = Product.new
    end

    def create
      @product = Product.new(product_params)
      if @product.save
        redirect_to admin_product_path(@product), notice: "Produit créé"
      else
        render :new
      end
    end

    def edit
    end

    def update
      if @product.update(product_params)
        redirect_to admin_product_path(@product), notice: "Produit mis à jour"
      else
        render :edit
      end
    end

    def destroy
      @product.destroy
      redirect_to admin_products_path, notice: "Produit supprimé"
    end

    private

    def set_product
      @product = Product.find_by!(slug: params[:id])
    end

    def product_params
      params.require(:product).permit(:name, :description, :price_cents, :unit, :category_id, :image)
    end
  end
