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
    end

    context 'can not save' do
      it "is in valid without name" do
        item = build(:item, seller_id: @user.id, name: "")
        item.valid?
        expect(item.errors[:name][0]).to include("入力してください")
      end

      it "is in valid without description" do
        item = build(:item, seller_id: @user.id, description: "")
        item.valid?
        expect(item.errors[:description][0]).to include("入力してください")
      end

      it "is in valid without big_category_id" do
        item = build(:item, seller_id: @user.id, big_category_id: "")
        item.valid?
        expect(item.errors[:big_category_id][0]).to include("入力してください")
      end

      it "is in valid without middle_category_id" do
        item = build(:item, seller_id: @user.id, middle_category_id: "")
        item.valid?
        expect(item.errors[:middle_category_id][0]).to include("入力してください")
      end

      it "is in valid without small_category_id" do
        item = build(:item, seller_id: @user.id, small_category_id: "")
        item.valid?
        expect(item.errors[:small_category_id][0]).to include("入力してください")
      end

      it "is in valid without condition_id" do
        item = build(:item, seller_id: @user.id, condition_id: "")
        item.valid?
        expect(item.errors[:condition_id][0]).to include("入力してください")
      end

      it "is in valid without shipping_cost_id" do
        item = build(:item, seller_id: @user.id, shipping_cost_id: "")
        item.valid?
        expect(item.errors[:shipping_cost_id][0]).to include("入力してください")
      end

      it "is in valid without shipping_method_id" do
        item = build(:item, seller_id: @user.id, shipping_method_id: "")
        item.valid?
        expect(item.errors[:shipping_method_id][0]).to include("入力してください")
      end

      it "is in valid without sender_prefecture" do
        item = build(:item, seller_id: @user.id, sender_prefecture: "")
        item.valid?
        expect(item.errors[:sender_prefecture][0]).to include("入力してください")
      end

      it "is in valid without days_for_shipment_id" do
        item = build(:item, seller_id: @user.id, days_for_shipment_id: "")
        item.valid?
        expect(item.errors[:days_for_shipment_id][0]).to include("入力してください")
      end

      it "is in valid without status_id" do
        item = build(:item, seller_id: @user.id, status_id: "")
        item.valid?
        expect(item.errors[:status_id][0]).to include("入力してください")
      end

    end
  end
end
