class ItemsController < ApplicationController
  before_action :authenticate_user!, only: [:new]
  def index
    @items = Item.all.order(created_at: :desc)
  end

  def new
    @items = Item.new
  end

  def create
    @items = Item.new(item_paramas)
    if @items.save
      redirect_to root_path
    else
      render :new
    end
  end

  def show
    @items = Item.find(params[:id])
  end

  def edit
    @items = Item.find(params[:id])
  end

  private
  def item_paramas
    params.require(:item).permit(:items_name, :image, :explanation, :category_id, :condition_id, :shipping_charges_burden_id, :prefecture_id, :shipping_day_id, :price).merge(user_id: current_user.id)
  end
end
