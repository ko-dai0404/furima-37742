class OrdersController < ApplicationController
  before_action :authenticate_user!, only: [:index]
  before_action :single_record, only: [:index, :create]
  before_action :move_to_root, except: [:show]
  before_action :move_to_root2, except: [:show]

  def index
    @order_purchase = OrderPurchase.new
  end

  def create
    @order_purchase = OrderPurchase.new(order_params)
    if @order_purchase.valid?
      pay_item
      @order_purchase.save
      redirect_to root_path
    else
      render :index
    end
  end

  private

  def order_params
    params.require(:order_purchase).permit(:postal, :prefectures_id, :city, :address, :building, :telephone).merge(
      user_id: current_user.id, item_id: params[:item_id], token: params[:token]
    )
  end

  def single_record
    @item = Item.find(params[:item_id])
  end

  def move_to_root
    redirect_to root_path if @item.purchase_record.present?
  end

  def move_to_root2
    redirect_to root_path if current_user.id == @item.user.id
  end

  def pay_item
    Payjp.api_key = ENV['PAYJP_SECRET_KEY']
    Payjp::Charge.create(
      amount: @item.price,
      card: order_params[:token],
      currency: 'jpy'
    )
  end
end
