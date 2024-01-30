class Admin::ProductsController < ApplicationController
    def index
        @product = product.all;
    end

    def new
    end

    def destroy
    end

    def update
    end
end
