require 'rails_helper'

RSpec.describe OrderPurchase, type: :model do
  before do
    user = FactoryBot.create(:user)
    item = FactoryBot.create(:item)
    @order_purchase = FactoryBot.build(:order_purchase, user_id: user.id, item_id: item.id)
  end
  describe '商品購入内容の保存' do
    context '商品が購入できる場合' do
      it '全ての項目があれば商品は購入される' do
        expect(@order_purchase).to be_valid
      end

      it 'buildingが空でも商品は購入される' do
        @order_purchase.building = ''
        expect(@order_purchase).to be_valid
      end
    end

    context '商品を購入できない場合' do
      it 'postalが空だと購入できない' do
        @order_purchase.postal = ''
        @order_purchase.valid?
        expect(@order_purchase.errors.full_messages).to include("Postal can't be blank", 'Postal is invalid')
      end

      it 'postalにハイフンが無いと購入できない' do
        @order_purchase.postal = '1231234'
        @order_purchase.valid?
        expect(@order_purchase.errors.full_messages).to include('Postal is invalid')
      end

      it 'postalが全角数字だと購入できない' do
        @order_purchase.postal = '１２３-１２３４'
        @order_purchase.valid?
        expect(@order_purchase.errors.full_messages).to include('Postal is invalid')
      end

      it 'prefectures_idが空だと購入できない' do
        @order_purchase.prefectures_id = '1'
        @order_purchase.valid?
        expect(@order_purchase.errors.full_messages).to include("Prefectures can't be blank")
      end

      it 'cityが空だと購入できない' do
        @order_purchase.city = ''
        @order_purchase.valid?
        expect(@order_purchase.errors.full_messages).to include("City can't be blank")
      end

      it 'addressが空だと購入できない' do
        @order_purchase.address = ''
        @order_purchase.valid?
        expect(@order_purchase.errors.full_messages).to include("Address can't be blank")
      end

      it 'telephoneが空だと購入できない' do
        @order_purchase.telephone = ''
        @order_purchase.valid?
        expect(@order_purchase.errors.full_messages).to include("Telephone can't be blank", 'Telephone is invalid')
      end

      it 'telephoneが全角数字だと購入できない' do
        @order_purchase.telephone = '０９０１２３４５６７８'
        @order_purchase.valid?
        expect(@order_purchase.errors.full_messages).to include('Telephone is invalid')
      end

      it 'telephoneが10桁未満だと購入できない' do
        @order_purchase.telephone = '090456789'
        @order_purchase.valid?
        expect(@order_purchase.errors.full_messages).to include('Telephone is invalid')
      end

      it 'telephoneが11桁以上だと購入できない' do
        @order_purchase.telephone = '090123412345'
        @order_purchase.valid?
        expect(@order_purchase.errors.full_messages).to include('Telephone is invalid')
      end

      it 'telephoneにハイフンがあると購入できない' do
        @order_purchase.telephone = '059-1234567'
        @order_purchase.valid?
        expect(@order_purchase.errors.full_messages).to include('Telephone is invalid')
      end

      it 'tokenが空だと購入できない' do
        @order_purchase.token = nil
        @order_purchase.valid?
        expect(@order_purchase.errors.full_messages).to include("Token can't be blank")
      end

      it 'user_idが紐付いていないと購入できない' do
        @order_purchase.user_id = ''
        @order_purchase.valid?
        expect(@order_purchase.errors.full_messages).to include("User can't be blank")
      end

      it 'item_idが紐付いていないと購入できない' do
        @order_purchase.item_id = ''
        @order_purchase.valid?
        expect(@order_purchase.errors.full_messages).to include("Item can't be blank")
      end
    end
  end
end
