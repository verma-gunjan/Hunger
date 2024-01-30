class Admin::ProductsController < ApplicationController
    def index
        @products = Product.all;
    end

    def new
        @product = Product.new
    end

    def create
        @product = Product.new(product_params)
        binding.pry
        if @product.save
            redirect_to edit_admin_product_path(@product)
        else
            render :new
        end
    end

    def destroy
        @product = Product.find(params[:id])
        if @product.present?
            @product.destroy
            redirect_to admin_products_path
        end
    end

    def edit
        @product = Product.find(params[:id])
    end

    def update
        @product = Product.find(params[:id])
        if @product.update(product_params)
            flash[:success] = "product successfully updated!"
            redirect_to admin_products_path
        else
            flash.now[:error] = "To-do item update failed"
            render 'admin/products/edit'
        end
    end

    private

    def product_params
        params.require(:product).permit(:name, :description, :price, :category_id)
    end
end
