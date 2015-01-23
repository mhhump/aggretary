class ProductsController < ApplicationController
  before_action :set_product, only: [:show, :edit, :update, :destroy]
  before_action :correct_user, only: [:edit, :update, :destroy]
  before_action :authenticate_user!, except: [:index, :show]


  def index
    @products = Product.all.order("created_at DESC").paginate(:page => params[:page], :per_page => 8)
  end

  def show
    @product = Product.find(params[:id])
  end

  def new
    @product = current_user.products.build
  end

  def create
    @product = current_user.products.build(product_params)
    if @product.save
      redirect_to @product, notice: 'Product was successfully created.'
    else
      render action: 'new'
    end
  end

  def edit

  end

  def update
    if @product.update(product_params)
      redirect_to @product, notice: 'Product was successfully updated.'
    else
      render action: 'edit'
    end
  end

  def delete
    @product = Product.find(params[:id])
  end

  def destroy
    Product.find(params[:id]).destroy
    redirect_to(:action => 'index')
  end


  private

  def set_product
    @product = Product.find(params[:id])
  end

  def correct_user
    @product = current_user.products.find_by(id: params[:id])
    redirect_to products_path, notice: "Not authorized to edit this product" if @product.nil?
    end

  def product_params
    params.require(:product).permit(:product_name, :description, :image)
  end
  
end
