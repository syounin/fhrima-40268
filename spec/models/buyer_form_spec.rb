require 'rails_helper'

RSpec.describe BuyerForm, type: :model do
  before do
    user = FactoryBot.create(:user)
    @buyer = FactoryBot.build(:buyer_form, user_id: user.id)
  end

  describe '商品の' do
    context '購入ができる時' do

      it '正常に購入できる' do
        expect(@buyer).to be_valid
      end

      it 'buildが空欄でも購入できる' do
      @buyer.building = ''
      expect(@buyer).to be_valid
      end

    end

    context '購入ができない時' do

      it '郵便番号がハイフンなしでは購入できない' do
        @buyer.post_code = '1234567'
        @buyer.valid?
        expect(@buyer.errors.full_messages).to include("Post code is invalid. Include hyphen(-)")
      end

      it '郵便番号が空では購入できない' do
        @buyer.post_code = ''
        @buyer.valid?
        expect(@buyer.errors.full_messages).to include("Post code is invalid. Include hyphen(-)")
      end

      it '都道府県が空では購入できない' do
        @buyer.prefecture_id = 1
        @buyer.valid?
        expect(@buyer.errors.full_messages).to include("Prefecture can't be blank")
      end

      it '市区町村が空では購入できない' do
        @buyer.city = ''
        @buyer.valid?
        expect(@buyer.errors.full_messages).to include("City can't be blank")
      end

      it '番地が空では購入できない' do
        @buyer.address = ''
        @buyer.valid?
        expect(@buyer.errors.full_messages).to include("Address can't be blank")
      end

      it '電話番号が空では購入できない' do
        @buyer.telephone_number = ''
        @buyer.valid?
        expect(@buyer.errors.full_messages).to include("Telephone number can't be blank", "Telephone number is invalid")
      end

      it "tokenが空では登録できないこと" do
        @buyer.token = nil
        @buyer.valid?
        expect(@buyer.errors.full_messages).to include("Token can't be blank")
      end

    end
  end
end
