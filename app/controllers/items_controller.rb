class ItemsController < ApplicationController
  def index
    @items = Itmem.all
  end

  def new
    @items = Items.new
end
