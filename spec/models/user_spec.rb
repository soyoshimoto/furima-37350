require 'rails_helper'
RSpec.describe User, type: :model do
  describe "ユーザー新規登録"do
  before do
    @user = FactoryBot.build(:user)
  end

  context 'ユーザー登録ができる時' do
    it "すべての値が正しく入力されていれば保存できること" do
      expect(@user).to be_valid
    end
  end

    context 'ユーザー登録ができない時' do
      it "nicknameが空だと保存できない" do
        @user.nickname = ''
        @user.valid?
        expect(@user.errors.full_messages).to include("Nickname can't be blank")
      end
      it "firstnameが空だと保存できない" do
        @user.firstname = ''
        @user.valid?
        expect(@user.errors.full_messages).to include("Firstname can't be blank")
      end
      it "lastnameが空だと保存できない" do
        @user.lastname = ''
        @user.valid?
        expect(@user.errors.full_messages).to include("Lastname can't be blank")
      end
      it "firstname_rubyが空だと保存できない" do
        @user.firstname_ruby = ''
        @user.valid?
        expect(@user.errors.full_messages).to include("Firstname ruby can't be blank")
      end
      it "lastname_rubyが空だと保存できない" do
        @user.lastname_ruby = ''
        @user.valid?
        expect(@user.errors.full_messages).to include("Lastname ruby can't be blank")
      end
      it "firstnameに半角文字が含まれていると保存できない" do
        @user.firstname = 'ss'
        @user.valid?
        expect(@user.errors.full_messages).to include("Firstname is invalid")
      end
      it "lastnameに半角文字が含まれていると保存できない" do
        @user.lastname = 'ss'
        @user.valid?
        expect(@user.errors.full_messages).to include("Lastname is invalid")
      end
      it "firstname_rubyにカタカナ以外の文字が含まれていると保存できない" do
        @user.firstname_ruby = 'ss'
        @user.valid?
        expect(@user.errors.full_messages).to include("Firstname ruby is invalid")
      end
      it "lastname_rubyにカタカナ以外の文字が含まれていると保存できない" do
        @user.lastname_ruby = 'ss'
        @user.valid?
        expect(@user.errors.full_messages).to include("Lastname ruby is invalid")
      end
      it "passwordが空では保存できない" do
        @user.password = ''
        @user.valid?
        expect(@user.errors.full_messages).to include("Password is invalid")
      end
      it "passwordが6文字未満では保存できない" do
        @user.password = '12bs5'
        @user.password_confirmation = '12bs5'
        @user.valid?
        expect(@user.errors.full_messages).to include('Password is too short (minimum is 6 characters)')
      end
      it "passwordが英字のみでは保存できない" do
        @user.password = 'abcdefgh'
        @user.password_confirmation = 'abcdefgh'
        @user.valid?
        expect(@user.errors.full_messages).to include('Password is invalid')
      end
      it "passwordが数字のみでは保存できない" do
        @user.password = '1234567'
        @user.password_confirmation = '1234567'
        @user.valid?
        expect(@user.errors.full_messages).to include('Password is invalid')
      end
      it "全角文字を含むpasswordは保存できない" do
        @user.password = 'ａｄｓ1ｄｆｅｄ'
        @user.password_confirmation = 'ａｄｓ1ｄｆｅｄ'
        @user.valid?
        expect(@user.errors.full_messages).to include('Password is invalid')
      end
      it "passwordとpassword_confirmationが不一致だと保存できない" do
        @user.password = '12sfthd35'
        @user.password_confirmation = '12fgdghyt46'
        @user.valid?
        expect(@user.errors.full_messages).to include("Password confirmation doesn't match Password")
      end
      it "emailが空だと保存できない" do
        @user.email = ''
        @user.valid?
        expect(@user.errors.full_messages).to include("Email can't be blank")
      end
      it "重複したemailは保存できない" do
        @user.save
        another_user = FactoryBot.build(:user, email: @user.email)
        another_user.valid?
        expect(another_user.errors.full_messages).to include('Email has already been taken')
      end
      it "emailに@を含まない場合は保存できない" do
        @user.email = 'testmail'
        @user.valid?
        expect(@user.errors.full_messages).to include('Email is invalid')
      end
      it "birthdayが空だと保存できない" do
        @user.birthday = ''
        @user.valid?
        expect(@user.errors.full_messages).to include("Birthday can't be blank")
      end
    end
  end
end