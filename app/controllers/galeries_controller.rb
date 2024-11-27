class GaleriesController < ApplicationController

  def index
    @items = Item.all
  end
end
