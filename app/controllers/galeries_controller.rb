class GaleriesController < ApplicationController

  def index
    @item = Item.all
  end
end
