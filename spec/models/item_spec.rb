require 'rails_helper'
require 'pry'

RSpec.describe Item, type: :model do
  describe '#create' do
    before do
      @user = create(:user)
    end

    context 'can save' do
      it "is valid" do
        item = build(:item, seller_id: @user.id)
        item.valid?
        expect(item).to be_valid
      end

      it "is valid without brand" do
        item = build(:item, seller_id: @user.id, brand_id: "")
        item.valid?
        expect(item).to be_valid
      end

      it "is valid for description with 40 characters" do
        item = build(:item, seller_id: @user.id, description: "１２３４５６７８９０１２３４５６７８９０１２３４５６７８９０１２３４５６７８９０")
        item.valid?
        expect(item).to be_valid
      end

      it "is valid for price with 300" do
        item = build(:item, seller_id: @user.id, price: 300)
        item.valid?
        expect(item).to be_valid
      end

      it "is valid for price with 9999999" do
        item = build(:item, seller_id: @user.id, price: 9999999)
        item.valid?
        expect(item).to be_valid
      end
    end

    context 'can not save' do
      it "is invalid without name" do
        item = build(:item, seller_id: @user.id, name: "")
        item.valid?
        expect(item.errors[:name][0]).to include("入力してください")
      end

      it "is invalid without description" do
        item = build(:item, seller_id: @user.id, description: "")
        item.valid?
        expect(item.errors[:description][0]).to include("入力してください")
      end

      it "is invalid without big_category_id" do
        item = build(:item, seller_id: @user.id, big_category_id: "")
        item.valid?
        expect(item.errors[:big_category_id][0]).to include("入力してください")
      end

      it "is invalid without middle_category_id" do
        item = build(:item, seller_id: @user.id, middle_category_id: "")
        item.valid?
        expect(item.errors[:middle_category_id][0]).to include("入力してください")
      end

      it "is invalid without small_category_id" do
        item = build(:item, seller_id: @user.id, small_category_id: "")
        item.valid?
        expect(item.errors[:small_category_id][0]).to include("入力してください")
      end

      it "is invalid without condition_id" do
        item = build(:item, seller_id: @user.id, condition_id: "")
        item.valid?
        expect(item.errors[:condition_id][0]).to include("入力してください")
      end

      it "is invalid without shipping_cost_id" do
        item = build(:item, seller_id: @user.id, shipping_cost_id: "")
        item.valid?
        expect(item.errors[:shipping_cost_id][0]).to include("入力してください")
      end

      it "is invalid without shipping_method_id" do
        item = build(:item, seller_id: @user.id, shipping_method_id: "")
        item.valid?
        expect(item.errors[:shipping_method_id][0]).to include("入力してください")
      end

      it "is invalid without sender_prefecture" do
        item = build(:item, seller_id: @user.id, sender_prefecture: "")
        item.valid?
        expect(item.errors[:sender_prefecture][0]).to include("入力してください")
      end

      it "is invalid without days_for_shipment_id" do
        item = build(:item, seller_id: @user.id, days_for_shipment_id: "")
        item.valid?
        expect(item.errors[:days_for_shipment_id][0]).to include("入力してください")
      end

      it "is invalid without status_id" do
        item = build(:item, seller_id: @user.id, status_id: "")
        item.valid?
        expect(item.errors[:status_id][0]).to include("入力してください")
      end

      it "is invalid for description with 41 characters or more" do
        item = build(:item, seller_id: @user.id, description: "１２３４５６７８９０１２３４５６７８９０１２３４５６７８９０１２３４５６７８９０１")
        item.valid?
        expect(item.errors[:description][0]).to include("してください")
      end


      it "is invalid for prices below 300" do
        item = build(:item, seller_id: @user.id, price: 299)
        item.valid?
        expect(item.errors[:price][0]).to include("以上の値にしてください")
      end

      it "is invalid for prices over 10 million" do
        item = build(:item, seller_id: @user.id, price: 10000000)
        item.valid?
        expect(item.errors[:price][0]).to include("以下の値にしてください")
      end
    end
  end
end
