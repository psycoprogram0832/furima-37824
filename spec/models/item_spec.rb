require 'rails_helper'
RSpec.describe Item, type: :model do
  before do
    @item = FactoryBot.build(:item)
  end
  
  describe '商品管理' do
    context '出品できるとき' do
      it '全て正しく存在すれば出品できる' do
      expect(@item).to be_valid
      
      end
    end
    context '出品できないとき' do
      it '商品画像を1枚つけることが必須であること。' do
      @item.image = nil
      @item.valid?
      expect(@item.errors.full_messages).to include("Image can't be blank")
      end
      it '商品名が必須であること。' do
      @item.product_name = ''
      @item.valid?
      expect(@item.errors.full_messages).to include("Product name can't be blank")
      end
      it '商品の説明が必須であること。' do
      @item.introduction = ''
      @item.valid?
      expect(@item.errors.full_messages).to include("Introduction can't be blank")
      end
      it 'カテゴリーの情報が必須であること。' do
        @item.category_id = nil
        @item.valid?
        expect(@item.errors.full_messages).to include("Category can't be blank")
      end
      it '商品の状態の情報が必須であること。' do
        @item.condition_id = nil
        @item.valid?
        expect(@item.errors.full_messages).to include("Condition can't be blank")
      end
      it '配送料の負担の情報が必須であること' do
        @item.delivery_charge_id = nil
        @item.valid?
        expect(@item.errors.full_messages).to include("Delivery charge can't be blank")
      end
      it '発送元の地域の情報が必須であること。' do
        @item.prefecture_id = nil
        @item.valid?
        expect(@item.errors.full_messages).to include("Prefecture can't be blank")
      end
      it '発送までの日数の情報が必須であること。' do
        @item.shipment_id = nil
        @item.valid?
        expect(@item.errors.full_messages).to include("Shipment can't be blank")
      end
      it '価格の情報が必須であること。'do
        @item.price = nil
        @item.valid?
        expect(@item.errors.full_messages).to include("Price cant be blank")
      end
      it '価格は、¥300以上でないと保存できない' do
        @item.price = '1'
        @item.valid?
        expect(@item.errors.full_messages).to include("Price must be greater than or equal to 300")
      end
      it '価格は、¥9,999,999以下でないと保存可能できない' do
        @item.price = '10000000'
        @item.valid?
        expect(@item.errors.full_messages).to include("Price must be less than or equal to 9999999")
      end
      it '価格は半角数値のみ保存可能であること。' do
        @item.price = 'アイウエオ'
        @item.valid?
        expect(@item.errors.full_messages).to include("Price is not a number")
      end
      it 'カテゴリーに「---」が選択されている場合は出品できない' do
        @item.category_id = '0'
        @item.valid?
        expect(@item.errors.full_messages).to include("Category can't be blank")
      end
        it '商品の状態に「---」が選択されている場合は出品できない' do
        @item.condition_id = '0'
        @item.valid?
        expect(@item.errors.full_messages).to include("Condition can't be blank")
      end
      it '配送料の負担に「---」が選択されている場合は出品できない' do
        @item.delivery_charge_id = '0'
        @item.valid?
        expect(@item.errors.full_messages).to include("Delivery charge can't be blank")
      end
      it '発送元の地域に「---」が選択されている場合は出品できない' do
        @item.prefecture_id = '0'
        @item.valid?
        expect(@item.errors.full_messages).to include("Prefecture can't be blank")
      end
      it '発送までの日数に「---」が選択されている場合は出品できない' do
        @item.shipment_id = nil
        @item.valid?
        expect(@item.errors.full_messages).to include("Shipment can't be blank")
      end
      it 'userが紐付いていなければ出品できない' do
        @item.user = nil
        @item.valid?
        expect(@item.errors.full_messages).to include("User must exist")
      end
    end
  end
end
