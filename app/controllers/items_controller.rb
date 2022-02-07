class ItemsController < ApplicationController
  def index
    @items = Item.all
  end

  def new
    @items = Item.new
  end

  def create
    Item.create(item_paramas)
  end

  private
  def item_paramas
    params.require(:item).permit(:items_name, :image, :explanation).maerge(user_id: current_user.id)
  end
end
