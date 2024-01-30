class Admin::CategoriesController < ApplicationController
    def index
        @categories = Category.all;
    end

    def new
        @category = Category.new
    end
      

    def create
        @category = Category.new(category_params)
        if @category.save
            redirect_to edit_admin_category_path(@category)
        else
            render :new
        end
    end

    def show
        @category = Category.find(params[:id])
    end

    def update
        @category = Category.find(params[:id])
        if @category.update(category_params)
            flash[:success] = "category item successfully updated!"
            redirect_to admin_categories_path
        else
            flash.now[:error] = "To-do item update failed"
            render 'admin/categories/edit'
        end
    end

    def edit
        @category = Category.find(params[:id])
        if @category.present?
            render 'admin/categories/edit'
        else
            flash.now[:error] = "category not found"
        end
    end
    
    def destroy
        @category = Category.find(params[:id])
        @category.destroy  
        if @category.destroy
            redirect_to admin_categories_path
        end
    end
    
    private
    def category_params
        params.require(:category).permit(:name, :description)
    end
end
