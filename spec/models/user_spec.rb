require 'rails_helper'

RSpec.describe User, type: :model do
  before do
    @user = FactoryBot.build(:user)
  end
  describe 'ユーザー新規登録' do
    it '全項目が存在すれば登録できる' do
      expect(@user).to be_valid
    end
    
    it 'nicknameが空では登録できない' do
      @user.nickname = ''  
      @user.valid?
      expect(@user.errors.full_messages).to include("Nickname can't be blank")
    end
    it 'emailが空では登録できない' do
      @user.email = ''
      @user.valid?
      expect(@user.errors.full_messages).to include("Email can't be blank")
    end
    it 'passwordが空では登録できない' do 
      @user.password = ''
      @user.valid?
      expect(@user.errors.full_messages).to include("Password can't be blank")
    end  
    it '重複したemailが存在する場合は登録できない' do
      @user.save
      another_user = FactoryBot.build(:user)
      another_user.email = @user.email
      another_user.valid?
      expect(another_user.errors.full_messages).to include('Email has already been taken')
    end
    it "passwordが5文字以下であれば登録できない" do
      @user.password = "00aaa"
      @user.password_confirmation = "000aaa"
      @user.valid?
      expect(@user.errors.full_messages).to include("Password is too short (minimum is 6 characters)")
    end
    it "passwordは英数字混合でないと登録できない" do
      @user.password = "000000"
      @user.valid?
      expect(@user.errors.full_messages).to include("Password is invalid")
    end
    it 'passwordとpassword_confirmationが不一致では登録できない' do
      @user.password = '123456'
      @user.password_confirmation = '1234567'
      @user.valid?
      expect(@user.errors.full_messages).to include("Password confirmation doesn't match Password")
    end
    it 'emailは@を含まないと登録できない' do
      @user.email = 'testmail'
      @user.valid?
      expect(@user.errors.full_messages).to include('Email is invalid')
    end
    it 'family_nameが空では登録できないこと' do
      @user.family_name = ''
      @user.valid?
      expect(@user.errors.full_messages).to include("Family name can't be blank")
    end 
    it "family_nameは漢字ひらがなでないと登録できない" do
      @user.family_name = "ヤマダ"
      @user.valid?
      expect(@user.errors.full_messages).to include("Family name is invalid")
    end
    it 'given_nameが空では登録できないこと' do
      @user.given_name = ''
      @user.valid?
      expect(@user.errors.full_messages).to include("Given name can't be blank")
    end 
    it "given_nameは漢字ひらがなでないと登録できない" do
      @user.given_name = "tarou"
      @user.valid?
      expect(@user.errors.full_messages).to include("Given name is invalid")
    end
    it 'family_name_kanaが空では登録できないこと' do
      @user.family_name_kana = ''
      @user.valid?
      expect(@user.errors.full_messages).to include("Family name kana can't be blank")
    end 
    it 'family_name_kanaはカタカナでないと登録できないこと' do
      @user.family_name_kana = "あそう"
      @user.valid?
      expect(@user.errors.full_messages).to include("Family name kana is invalid")
    end 
    it 'given_name_kanaが空では登録できないこと' do
      @user.given_name_kana = ''
      @user.valid?
      expect(@user.errors.full_messages).to include("Given name kana can't be blank")
    end
    it 'given_name_kanaはカタカナでないと登録できないこと' do
      @user.given_name_kana = "tarou"
      @user.valid?
      expect(@user.errors.full_messages).to include("Given name kana is invalid")
    end
    it 'birth_dateが空では登録できないこと' do
      @user.birth_date = ''
      @user.valid?
      expect(@user.errors.full_messages).to include("Birth date can't be blank")
    end
  end
end
