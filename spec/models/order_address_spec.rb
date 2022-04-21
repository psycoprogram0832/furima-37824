require 'rails_helper'

  RSpec.describe OrderAddress, type: :model do
    before do
        @user = FactoryBot.create(:user)
        @item = FactoryBot.create(:item)
        @order_address = FactoryBot.build(:order_address, user_id: @user.id, item_id: @item.id)
        sleep(1)
    end

    context '内容に問題ない場合' do
      it "すべての入力があればあれば保存ができること" do
        expect(@order_address).to be_valid
      end
      it "建物名は任意であること" do
        @order_address.building = ''
        expect(@order_address).to be_valid
      end
    end
    context "出品できないとき" do
      it "郵便番号が必須であること" do
        @order_address.post_code = ''
        @order_address.valid?
        expect(@order_address.errors.full_messages).to include("Post code can't be blank")
      end
      it "郵便番号は、「3桁ハイフン4桁」の半角文字列のみ保存可能なこと" do
        @order_address.post_code = '1111111'
        @order_address.valid?
        expect(@order_address.errors.full_messages).to include("Post code is invalid. Include hyphen(-)")
      end
      it "都道府県が必須であること" do
        @order_address.prefecture_id = ''
        @order_address.valid?
        expect(@order_address.errors.full_messages).to include("Prefecture can't be blank")
      end
      it "市区町村が必須であること" do
        @order_address.city = ''
        @order_address.valid?
        expect(@order_address.errors.full_messages).to include("City can't be blank")
      end
      it "番地が必須であること" do
        @order_address.address = ''
        @order_address.valid?
        expect(@order_address.errors.full_messages).to include("Address can't be blank")
      end
      
      it "電話番号が必須であること" do
        @order_address.phone_number = ''
        @order_address.valid?
        expect(@order_address.errors.full_messages).to include("Phone number can't be blank")
      end
      it "電話番号は、10桁以上11桁以内の半角数値のみ保存可能なこと" do
        @order_address.phone_number = '09055555Y'
        @order_address.valid?
        expect(@order_address.errors.full_messages).to include("Phone number is invalid")
      end
      it "電話番号が9桁以下では購入できない" do
        @order_address.phone_number = '090111111'
        @order_address.valid?
        expect(@order_address.errors.full_messages).to include("Phone number is invalid")
      end
      it "電話番号が12桁以上では購入できない" do
        @order_address.phone_number = '090123412341'
        @order_address.valid?
        expect(@order_address.errors.full_messages).to include("Phone number is invalid")
      end
      it "電話番号に半角数字以外が含まれている場合は購入できない" do
        @order_address.phone_number = '0905555Y555'
        @order_address.valid?
        expect(@order_address.errors.full_messages).to include("Phone number is invalid")
      end
      it "tokenが空では購入できない" do
        @order_address.token = nil
        @order_address.valid?
        expect(@order_address.errors.full_messages).to include("Token can't be blank")
      end
      it "userが紐付いていなければ購入できない" do
        @order_address.user_id = nil
        @order_address.valid?
        expect(@order_address.errors.full_messages).to include("User can't be blank")
      end
      it "itemが紐付いていなければ購入できない" do
        @order_address.item_id = nil
        @order_address.valid?
        expect(@order_address.errors.full_messages).to include("Item can't be blank")
      end
    end
  end