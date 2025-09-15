class PublicController < ApplicationController
  layout 'public'
  def home
    @products = Product.includes(:category).with_attached_image.all
  end

  def show
    @product = Product.includes(:category).with_attached_image.find_by!(slug: params[:id])
    @related_products = Product.includes(:category)
                             .with_attached_image
                             .where(category: @product.category)
                             .where.not(id: @product.id)
                             .limit(4)
  end
end
