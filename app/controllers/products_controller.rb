class ProductsController < ApplicationController

  before_action :find_product, only: %i[show edit update destroy upvote]
  before_action :admin?, only: %i[edit] 

  def index
    @products = Product
    @products = @products.where('price >= ?', params[:price_from]) if params[:price_from]
    @products = @products.order(:id)
  end

  def create
    product = Product.create(products_params)

    if product.persisted?
      redirect_to products_path
    else
      render json: product.errors, status: :unprocessable_entity
    end
  end

  def new #рендерить форму яка посилається в create
  end

  def show
    render body: 'Page not found', status: 404  unless @product  
  end

  def edit
    render body: 'Page not found', status: 404  unless @product  
  end

  def update
    if @product.update(products_params)
      redirect_to product_path
    else 
      render json: product.errors, status: :unprocessable_entity
    end
  end

  def destroy
    if @product.destroy.destroyed?
      redirect_to products_path
    else
      render json: product.errors, status: :unprocessable_entity
    end
  end

  def upvote
    @product.increment! :votes_count
    redirect_to products_path
  end

  def expensive
    @products = Product.where('price > 500')
    render :index
  end
 
  private
    def products_params
      params.permit(:name, :price, :description, :weight)
    end

    def find_product
      @product = Product.where(id: params[:id]).first
      render_404 unless @product
    end
end
