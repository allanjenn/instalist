class ItemsController < ApplicationController
  def index
    @item = Item.all
  end

  def new
    @item = Item.new
  end

  def create
    @item = Item.new(item_params)
      if @item.save
        redirect_to items_path 
      else
        redirect_to root_path
      end 
  end

  def add_to_cart
    @item = Item.find(params[:id]) # Figure out which item based on the id
    current_user.items << @item  # Use << to push the item into the user's items
    redirect_to items_path# Redirect them to items index
  end

  private

  def item_params
    params.require(:item).permit(:name, :image)
  end   
end