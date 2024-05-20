require 'rails_helper'


RSpec.describe Item, type: :model do
    before do
      @item = FactoryBot.build(:item)
    end
    describe '商品の' do
      context '出品ができる時' do
        it '正常に出品できる' do
          @item.item_name = '物'
          @item.category_id = 2
          @item.item_condition_id = 2
          @item.delivery_cost_id = 2
          @item.prefecture_id = 2
          @item.delivery_day_id = 2
          expect(@item).to be_valid
        end
      end
      context '出品ができない時' do
        it 'item_nameが空では出品できない' do
          @item.item_name = ''
          @item.valid?
          expect(@item.errors.full_messages).to include("Item name can't be blank")
        end
        it '商品画像がないと出品できない' do
          @item.image = nil
          @item.valid?
          expect(@item.errors.full_messages).to include("Image can't be blank")
        end
        it '商品の説明文が空欄だと出品できない' do
          @item.item_explanation = ''
          @item.valid?
          expect(@item.errors.full_messages).to include("Item explanation can't be blank")
        end
        it '商品の説明文が1000文字以上だと出品できない' do
          @item.item_explanation = 'あいうえお'*1000
          @item.valid?
          expect(@item.errors.full_messages).to include("Item explanation is too long (maximum is 1000 characters)")
        end
        it '商品のカテゴリーが入力されていないと出品できない' do
          @item.category_id = 1
          @item.valid?
          expect(@item.errors.full_messages).to include("Category can't be blank")
        end
        it '商品の状態が入力されていないと出品できない' do
          @item.item_condition_id = 1
          @item.valid?
          expect(@item.errors.full_messages).to include("Item condition can't be blank")
        end
        it '発送料の負担が入力されていないと出品できない' do
          @item.delivery_cost_id = 1
          @item.valid?
          expect(@item.errors.full_messages).to include("Delivery cost can't be blank")
        end
        it '発送元の地域が入力されていないと出品できない' do
          @item.prefecture_id = 1
          @item.valid?
          expect(@item.errors.full_messages).to include("Prefecture can't be blank")
        end
        it '発送までの日数が入力されていないと出品できない' do
          @item.delivery_day_id = 1
          @item.valid?
          expect(@item.errors.full_messages).to include("Delivery day can't be blank")
        end
        it '販売価格が全角だと登録できない' do
          @item.item_price = 'あああああああ'
          @item.valid?
          expect(@item.errors.full_messages).to include("Item price is not a number")
        end
        it '販売価格が300円より少ないときは出品できない'do
          @item.item_price = 299
          @item.valid?
          expect(@item.errors.full_messages).to include("Item price must be greater than or equal to 300")
        end
        it '販売価格が9999999より多いときは出品できない' do
          @item.item_price = 10_000_000
          @item.valid?
          expect(@item.errors.full_messages).to include("Item price must be less than or equal to 9999999")
        end
      end
    end
end
