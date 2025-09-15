class Admin::DashboardController < ApplicationController

    def index
      @categories_count = Category.count
      @products_count = Product.count
    end
end
