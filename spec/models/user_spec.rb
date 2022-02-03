require 'rails_helper'
RSpec.describe User, type: :model do
  before do
    @user = FactoryBot.build(:user)
  end
  describe "ユーザー新規登録" do
    it "nicknameが必須" do
      @user.nickname = ''
      user.valid?
      expect(user.errors.full_messages).to include("Nickname can't be blank")
    end
    it "firstnameが必須" do
      @user.firstname = ''
      user.valid?
      expect(user.errors.full_messages).to include("Firstname can't be blank")
    end
    it "lastnameが必須"do
      @user.lastname = ''
      user.valid?
      expect(user.errors.full_messages).to include("Lastname can't be blank")
    end
    it "firstname_rubyが必須"do
      @user.firstname_ruby = ''
      user.valid?
      expect(user.errors.full_messages).to include("Firstname_ruby can't be blank")
    end
    it "lastname_rubyが必須"do
      @user.lastname_ruby = ''
      user.valid?
      expect(user.errors.full_messages).to include("Lastname_ruby can't be blank")
    end
    it "birthdayが必須"do
      @user.birthday = ''
      user.valid?
      expect(user.errors.full_messages).to include("Birthday can't be blank")
    end
  end
end