class CartController < ApplicationController
  
  def add
    id = params[:id]
    # if the cart has already been
      if session[:cart] then
        cart = session[:cart]
      else
        session[:cart] = {}
        cart = session[:cart]
      end

      if cart[id] then
        cart[id] = cart[id] + 1
      else
        cart[id] = 1
      end
      redirect_to :action => :index
  end
  def clearCart
    session[:cart] = nil
    redirect_to :action => :index
  end

  def index
    # if there is a cart, pass it to the page for display else pass an empty value
    if session[:cart] then
      @cart = session[:cart]
    else
      @cart = {}
    end
  end
end
