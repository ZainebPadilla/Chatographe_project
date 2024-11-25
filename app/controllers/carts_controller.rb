class CartsController < ApplicationController

  before_action :authenticate_user! 

  # def add_item
  #   user = current_user
  #   item = Item.find(params[:item_id])
  #   cart = user.cart || user.create_cart 
  #   unless cart.items.include?(item)
  #     cart.items << item  
  #   end

  #   flash[:notice] = "#{item.name} a été ajouté à votre panier."
  #   redirect_to cart_path(cart)
  # end

  def add_item
    @cart = current_user.cart || current_user.create_cart
    @item = Item.find_by(id: params[:item_id])
  
    unless @item
      flash[:alert] = "L'article est introuvable."
      redirect_to items_path and return
    end
  
    if @cart.cart_items.exists?(item_id: @item.id)
      flash[:notice] = "Cet item est déjà dans votre panier."
    else
      @cart.items << @item
      flash[:success] = "#{@item.title} a été ajouté au panier !"
    end
  
    redirect_to cart_path(@cart) # ou item_path(@item), selon ton choix
  end
  
  def show
    @cart = current_user.cart  
    @items = @cart.items
  end

  def remove_item
    @cart = current_user.cart
    @item = @cart.items.find(params[:id])
    @cart.items.delete(item)

    flash[:notice] = "L'article a été retiré du panier."
    redirect_to cart_path
  end

end
