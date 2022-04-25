class OrdersController < ApplicationController
  binding.pry
  before_action :authenticate_user!, only: [:index]
  before_action :move_to_root, except: [:index]

  def index
    @item = Item.find(params[:item_id])
    @order_purchase = OrderPurchase.new

  end

  def create
    @order_purchase = OrderPurchase.new(order_params)
    if @order_purchase.valid?
      @order_purchase.save
      redirect_to root_path
    else
      @item = Item.find(params[:item_id])
      render :index
    end
  end

  private

  def order_params
    params.require(:order_purchase).permit(:postal, :prefectures_id, :city, :address, :building, :telephone).merge(
      user_id: current_user.id, item_id: params[:item_id], token: params[:token]
    )
  end

  def move_to_root
    redirect_to root_path if current_user.id == @item.user.id
    binding.pry
  end
end
