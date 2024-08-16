class ItemsController < ApplicationController
  before_action :authenticate_user!, only: [:new]

  def index
    @items = Item.all
  end

  def new
    @item = Item.new
  end

  def create
    @item = Item.new(item_params)
    if @item.save
      redirect_to root_path
    else
      render :new, status: :unprocessable_entity
    end
  end

  private

  def item_params
    allowed_attributes = [
      :image, :name,
      :description, :category_id, :condition_id, :delivery_charge_id,
      :shipping_area_id, :shipping_day_id, :price
    ]
    params.require(:item).permit(allowed_attributes).merge(user_id: current_user.id)
  end
end
