class ApplicationController < ActionController::Base
  before_action :fetch_basket

  private
    def fetch_basket
      if session[:basket_id]
        basket = Basket.find_by(:id => session[:basket_id])
        if basket.present?
          @current_basket = basket
        else
          session[:basket_id] = nil
        end
      end

      if session[:basket_id] == nil
        @current_basket = nil
      end
    end
end
