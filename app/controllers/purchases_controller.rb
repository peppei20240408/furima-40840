class PurchasesController < ApplicationController
  before_action :authenticate_user!

  def index
    gon.public_key = ENV['PAYJP_PUBLIC_KEY']
    @item = Item.find(params[:item_id])
    @purchase_shipping_address = PurchaseShippingAddress.new
  end

  def create
    @item = Item.find(params[:item_id])
    @purchase_shipping_address = PurchaseShippingAddress.new(purchase_params)
    if @purchase_shipping_address.valid?
      pay_item
      @purchase_shipping_address.save
      redirect_to root_path
    else
      render :index, status: :unprocessable_entity
    end
  end

  private

  def purchase_params
    params.require(:purchase_shipping_address).permit(:postal_code, :shipping_area_id, :city, :address, :building_name, :phone_number).merge(
      user_id: current_user.id, item_id: params[:item_id], token: params[:token]
    )
  end

  def pay_item
    Payjp.api_key = ENV['PAYJP_SECRET_KEY']
    Payjp::Charge.create(
      amount: @item.price,
      card: purchase_params[:token],
      currency: 'jpy'
    )
  end
end
