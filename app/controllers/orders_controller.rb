class OrdersController < ApplicationController
  def index
    @item = Item.find(params[:item_id])
    @order_purchase = OrderPurchase.new
  end

  def create
    @order_purchase = OrderPurchase.new(order_params)
    if @order_purchase.valid?
      @order_purchase.save
       return redirect_to root_path
    else
      @item = Item.find(params[:item_id])
       render :index
    end
  end

  private

  def order_params
    params.require(:order_purchase).permit(:postal, :prefectures_id, :city, :address, :building, :telephone).merge(user_id: current_user.id, item_id: params[:item_id],token: params[:token])
  end
end
