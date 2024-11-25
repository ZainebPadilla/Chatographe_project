class CartsController < ApplicationController

  before_action :authenticate_user! 

  def add_item
    user = current_user
    item = Item.find(params[:item_id])
    cart = user.cart || user.create_cart 
    unless cart.items.include?(item)
      cart.items << item  
    end

    flash[:notice] = "#{item.name} a été ajouté à votre panier."
    redirect_to cart_path(cart)
  end
  
  def show
    @cart = current_user.cart  
    @items = @cart.items
  end

  def remove_item
    @cart = current_user.cart
    item = @cart.items.find(params[:id])
    @cart.items.delete(item)

    flash[:notice] = "L'article a été retiré du panier."
    redirect_to cart_path
  end

end
