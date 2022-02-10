require 'rails_helper'

RSpec.describe Item, type: :model do
  describe "商品登録" do
  before do
    @item = FactoryBot.build(:item)
  end

  context '商品登録ができる時' do
    it "すべての値が正しく入力されていれば保存できること" do
      expect(@item).to be_valid
    end
  end

    context '商品登録ができない時' do
      it "商品画像1枚つけることが必須" do
        @item.image = nil
        @item.valid?
        expect(@item.errors.full_messages).to include("Image can't be blank")
      end
      it "商品名が必須" do
        @item.items_name = ''
        @item.valid?
        expect(@item.errors.full_messages).to include("Items name can't be blank")
      end
      it "商品説明文が必須" do
        @item.explanation = ''
        @item.valid?
        expect(@item.errors.full_messages).to include("Explanation can't be blank")
      end
      it "カテゴリーの情報が必須" do
        @item.category_id = '1'
        @item.valid?
        expect(@item.errors.full_messages).to include("Category can't be blank")
      end
      it "商品の状態の情報が必須" do
        @item.condition_id = '1'
        @item.valid?
        expect(@item.errors.full_messages).to include("Condition can't be blank")
      end
      it "配送料の負担の情報が必須" do
        @item.shipping_charges_burden_id = '1'
        @item.valid?
        expect(@item.errors.full_messages).to include("Shipping charges burden can't be blank")
      end
      it "発送元の地域の情報が必須" do
        @item.prefecture_id = '1'
        @item.valid?
        expect(@item.errors.full_messages).to include("Prefecture can't be blank")
      end
      it "発送までの日数の情報が必須" do
        @item.shipping_day_id = '1'
        @item.valid?
        expect(@item.errors.full_messages).to include("Shipping day can't be blank")
      end
      it "価格の情報が必須" do
        @item.price = ''
        @item.valid?
        expect(@item.errors.full_messages).to include("Price can't be blank")
      end
    end
  end
end
