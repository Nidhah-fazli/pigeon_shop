class ItemsController < ApplicationController
  before_action :current_basket

  def create
    # Find associated product and current basket
    selected_product = Product.find(params[:product_id])
  
    # If basket already has this product then find the relevant item and iterate quantity otherwise create a new item for this product
    if @current_basket.products.include?(selected_product)
      # Find the item with the selected_product
      @item = @current_basket.items.find_by(:product_id => selected_product)
      # Iterate the item's quantity by one
      @item.quantity += 1
    else
      @item = Item.new
      @item.basket = @current_basket
      @item.product = selected_product
    end
  
    # Save and redirect to basket show path
    @item.save
    redirect_to :root
  end
  
  private
    def item_params
      params.require(:item).permit(:quantity,:product_id, :basket_id)
    end

    def current_basket
      if session[:basket_id]
        basket = Basket.find_by(:id => session[:basket_id])
        if basket.present?
          @current_basket = basket
        else
          session[:basket_id] = nil
        end
      end

      if session[:basket_id] == nil
        @current_basket = Basket.create
        session[:basket_id] = @current_basket.id
      end
    end
end
