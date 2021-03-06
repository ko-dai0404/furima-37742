class ItemsController < ApplicationController
  before_action :authenticate_user!, only: [:new, :edit, :destroy]
  before_action :single_record, only: [:show, :edit, :update, :destroy]
  before_action :move_to_index, except: [:index, :new, :create, :show]

  def index
    @items = Item.includes(:user).order('created_at DESC')
  end

  def new
    @item = Item.new
  end

  def create
    @item = Item.new(item_params)
    if @item.save
      redirect_to root_path
    else
      render :new
    end
  end

  def show
  end

  def edit
  end

  def update
    if @item.update(item_params)
      redirect_to item_path
    else
      render :edit
    end
  end

  def destroy
    @item.destroy
    redirect_to root_path
  end

  private

  def item_params
    params.require(:item).permit(:image, :product, :description, :category_id, :status_id, :burden_id, :prefectures_id,
                                 :shipping_id, :price).merge(user_id: current_user.id)
  end

  def single_record
    @item = Item.find(params[:id])
  end

  def move_to_index
    redirect_to action: :index unless current_user.id == @item.user.id
    redirect_to action: :index if @item.purchase_record.present?
  end
end
