require 'rails_helper'

RSpec.describe User, type: :model do
  before do
    @user = FactoryBot.build(:user)
  end
  context '新規登録できるとき' do
    it '全てが存在すれば登録できる' do
      @user
      expect(@user).to be_valid
    end
  end

  context '新規登録できないとき' do
    it 'nicknameが空だと登録できない' do
      @user.nickname = ''
      @user.valid?
      expect(@user.errors.full_messages).to include("Nickname can't be blank")
    end

    it 'emailが空では登録できない' do
      @user.email = ''
      @user.valid?
      expect(@user.errors.full_messages).to include("Email can't be blank")
    end

    it 'emailが@なしでは登録できない' do
      @user.email = 'ko-daigmail.com'
      @user.valid?
      expect(@user.errors.full_messages).to include('Email is invalid')
    end

    it 'passwordが空では登録できない' do
      @user.password = ''
      @user.valid?
      expect(@user.errors.full_messages).to include("Password can't be blank")
    end

    it 'passwprdが半角英語のみではない時は登録できない' do
      @user.password = 'aaaaaa'
      @user.valid?
      expect(@user.errors.full_messages).to include("Password confirmation doesn't match Password", 'Password is invalid')
    end

    it 'passwprdが半角数字のみではない時は登録できない' do
      @user.password = '123456'
      @user.valid?
      expect(@user.errors.full_messages).to include("Password confirmation doesn't match Password", 'Password is invalid')
    end

    it 'passwprdが全角英数字が入っている時は登録できない' do
      @user.password = '１１１A A A'
      @user.valid?
      expect(@user.errors.full_messages).to include("Password confirmation doesn't match Password", 'Password is invalid')
    end

    it 'passwprdが6文字以上ではない時は登録できない' do
      @user.password = 'aaa11'
      @user.valid?
      expect(@user.errors.full_messages).to include('Password is too short (minimum is 6 characters)')
    end

    it 'encrypted_passwordが空では登録できない' do
      @user.password_confirmation = ''
      @user.valid?
      expect(@user.errors.full_messages).to include("Password confirmation doesn't match Password")
    end

    it 'passwordとencrypted_passwordの中身が同じでないと登録できない' do
      @user.password_confirmation = 'aaa222'
      @user.valid?
      expect(@user.errors.full_messages).to include("Password confirmation doesn't match Password")
    end

    it 'last_nameが空では登録できない' do
      @user.last_name = ''
      @user.valid?
      expect(@user.errors.full_messages).to include("Last name can't be blank")
    end

    it 'first_nameが空では登録できない' do
      @user.first_name = ''
      @user.valid?
      expect(@user.errors.full_messages).to include("First name can't be blank")
    end

    it 'last_nameが半角では登録できない' do
      @user.last_name = 'ｼﾓﾑﾗ'
      @user.valid?
      expect(@user.errors.full_messages).to include('Last name is invalid')
    end

    it 'first_nameが半角では登録できない' do
      @user.first_name = 'ｺｳﾀﾞｲ'
      @user.valid?
      expect(@user.errors.full_messages).to include('First name is invalid')
    end

    it 'last_name_kanaが空では登録できない' do
      @user.last_name_kana = ''
      @user.valid?
      expect(@user.errors.full_messages).to include("Last name kana can't be blank")
    end

    it 'first_name_kanaが空では登録できない' do
      @user.first_name_kana = ''
      @user.valid?
      expect(@user.errors.full_messages).to include("First name kana can't be blank")
    end

    it 'last_name_kanaが全角カタカナ以外では登録できない' do
      @user.last_name_kana = 'ｼﾓﾑﾗ'
      @user.valid?
      expect(@user.errors.full_messages).to include('Last name kana is invalid')
    end

    it 'first_name_kanaが全角カタカナ以外では登録できない' do
      @user.first_name_kana = 'ｺｳﾀﾞｲ'
      @user.valid?
      expect(@user.errors.full_messages).to include('First name kana is invalid')
    end

    it 'birthdayが空では登録できない' do
      @user.birthday = ''
      @user.valid?
      expect(@user.errors.full_messages).to include("Birthday can't be blank")
    end
  end
end
