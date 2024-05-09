require 'rails_helper'

RSpec.describe User, type: :model do
  before do
    @user = FactoryBot.build(:user)
  end

  describe 'ユーザー新規登録' do
    it 'nicknameが空では登録できない' do
      @user.nickname = ''
      @user.valid?
      expect(@user.errors.full_messages).to include "Nickname can't be blank"
    end
    it 'emailが空では登録できない' do
      @user.email = ''
      @user.valid?
      expect(@user.errors.full_messages).to include "Email can't be blank"
    end

    it 'passwordが空では登録できない' do
      @user.password = ''
      @user.valid?
      expect(@user.errors.full_messages).to include("Password can't be blank")
    end
    it 'passwordとpassword_confirmationが不一致では登録できない' do
      @user.password = 'aaaaaa000'
      @user.password_confirmation = 'bbbbb000'
      @user.valid?
      expect(@user.errors.full_messages).to include("Password confirmation doesn't match Password")
    end
    it 'emailは@を含まないと登録できない' do
      @user.email = 'testmail'
      @user.valid?
      expect(@user.errors.full_messages).to include('Email is invalid')
    end
    it 'passwordが5文字以下では登録できない' do
      @user.password = '00000'
      @user.password_confirmation = '00000'
      @user.valid?
      expect(@user.errors.full_messages).to include('Password is too short (minimum is 6 characters)')
    end
    it 'passwordが129文字以上では登録できない' do
      @user.password = Faker::Internet.password(min_length: 129, max_length: 150)
      @user.password_confirmation = @user.password
      @user.valid?
      expect(@user.errors.full_messages).to include("Password is too long (maximum is 128 characters)")
    end
    it 'last_nameが全角文字でないと登録できない' do
      @user.last_name = 'aoao'
      @user.valid?
      expect(@user.errors.full_messages).to include("Last name 全角文字を使用してください")
    end
    it 'first_nameが全角文字でないと登録できない' do
      @user.first_name = 'aoao'
      @user.valid?
      expect(@user.errors.full_messages).to include("First name 全角文字を使用してください")
    end
    it 'last_name_kanaがカナ文字でないと登録できない' do
      @user.last_name_kana = 'aoao'
      @user.valid?
      expect(@user.errors.full_messages).to include("Last name kana カナ文字を使用してください")
    end
    it 'first_name_kanaがカナ文字でないと登録できない' do
      @user.first_name_kana = 'aoao'
      @user.valid?
      expect(@user.errors.full_messages).to include("First name kana カナ文字を使用してください")
    end
    it 'birthが空では登録できない' do
      @user.birth = ''
      @user.valid?
      expect(@user.errors.full_messages).to include("Birth can't be blank")
    end
  end
end
