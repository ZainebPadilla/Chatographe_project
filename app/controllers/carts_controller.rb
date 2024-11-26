class CartsController < ApplicationController

  before_action :authenticate_user! 

  def add_item
    user = current_user
    item = Item.find_by(id: params[:item_id])

    if item
      cart = user.cart || user.create_cart
      if cart.items.include?(item)
        flash[:alert] = "#{item.name} est déjà dans votre panier."
      else
        cart.items << item
        flash[:notice] = "#{item.name} a été ajouté à votre panier."
      end
    else
      flash[:alert] = "L'article que vous essayez d'ajouter n'existe pas."
    end

    redirect_to cart_path(cart)
  end
  
  def show
    @cart = current_user.cart
    if @cart
      @items = @cart.items
    else
      flash[:alert] = "Votre panier est vide."
      redirect_to root_path
    end
  end
  

  def remove_item
    @cart = current_user.cart
    item = @cart.items.find(params[:id])
    @cart.items.delete(item)

    flash[:notice] = "L'article a été retiré du panier."
    redirect_to cart_path
  end

end
