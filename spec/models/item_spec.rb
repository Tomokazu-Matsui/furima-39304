require 'rails_helper'
RSpec.describe Item, type: :model do
  before do
    @item = FactoryBot.build(:item)
  end

  describe '商品の出品登録' do
    context '出品登録ができるとき' do
      it '全ての入力事項が、存在すれば登録できる' do
        expect(@item).to be_valid
      end
    end

    context '出品ができないとき' do
      it '１枚画像がないと出品できない' do
        @item.image = nil
        @item.valid?
        expect(@item.errors.full_messages).to include("Image can't be blank")
      end
      it '商品名が空欄だと出品できない' do
        @item.item_name = ""
        @item.valid?
        expect(@item.errors.full_messages).to include("Item name can't be blank")
      end
      it 'カテゴリーの情報が「---」だと出品できない' do
        @item.item_category_id = 0
        @item.valid?
        expect(@item.errors.full_messages).to include('Item category must be other than 0')
      end
      it '商品の状態の情報が「---」だと出品できない' do
        @item.item_sales_status_id = 0
        @item.valid?
        expect(@item.errors.full_messages).to include('Item sales status must be other than 0')
      end
      it '配送料の負担の情報が「---」だと出品できない' do
        @item.item_shipping_fee_status_id = 0
        @item.valid?
        expect(@item.errors.full_messages).to include('Item shipping fee status must be other than 0')
      end
      it '発送元の地域の情報が「---」だと出品できない' do
        @item.item_prefecture_id = 0
        @item.valid?
        expect(@item.errors.full_messages).to include('Item prefecture must be other than 0')
      end
      it '発送までの日数の情報が「---」だと出品できない' do
        @item.item_scheduled_delivery_id = 0
        @item.valid?
        expect(@item.errors.full_messages).to include('Item scheduled delivery must be other than 0')
      end

      it '価格が空欄だと出品できない' do
        @item.item_price = ""
        @item.valid?
        expect(@item.errors.full_messages).to include("Item price is not a number")
      end
      it '価格が半角数字以外では登録できない' do
        @item.item_price = "１０００"
        @item.valid?
        expect(@item.errors.full_messages).to include("Item price is not a number")
      end
      it '価格の範囲が、300円未満だと出品できない' do
        @item.item_price = 100
        @item.valid?
        expect(@item.errors.full_messages).to include("Item price must be greater than 300")
      end
      it '価格の範囲が、9,999,999円を超えると出品できない' do
        @item.item_price = 10_000_000
        @item.valid?
        expect(@item.errors.full_messages).to include( "Item price must be less than 9999999")
      end
    end
  end
end