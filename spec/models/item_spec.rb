require 'rails_helper'
require 'pry'

RSpec.describe Item, type: :model do
  describe '#create' do
  let(:user) {create(:user)}
  let(:big_category) {create(:big_category)}
  let(:middle_category) {create(:middle_category)}
  let(:small_category) {create(:small_category)}
  let(:brand) {create(:brand)}
  let(:condition) {create(:condition)}
  let(:shipping_cost) {create(:shipping_cost)}
  let(:shipping_method) {create(:shipping_method)}
  let(:days_for_shipment) {create(:days_for_shipment)}
  let(:status) {create(:status)}
  let(:image_path) { File.join(Rails.root, 'spec/fixtures/image.jpg') }
  let(:image) { Rack::Test::UploadedFile.new(image_path)}
  let(:item) {build(:item,
    seller_id: user.id,
    big_category_id: big_category.id,
    middle_category_id: middle_category.id,
    small_category_id: small_category.id,
    brand_id: brand.id,
    condition_id: condition.id,
    shipping_cost_id: shipping_cost.id,
    shipping_method_id: shipping_method.id,
    days_for_shipment_id: days_for_shipment.id,
    status_id: status.id,
    item_images_attributes: [{image: image}, {image: image}])}


    context 'can save' do
      before do
        item
      end
      it "is valid" do
        item.valid?
        expect(item).to be_valid
      end

      it "is valid without brand" do
        item.brand_id = ""
        item.valid?
        expect(item).to be_valid
      end

      it "is valid for description with 40 characters" do
        item.description = "１２３４５６７８９０１２３４５６７８９０１２３４５６７８９０１２３４５６７８９０"
        item.valid?
        expect(item).to be_valid
      end

      it "is valid for price with 300" do
        item.price = 300
        item.valid?
        expect(item).to be_valid
      end

      it "is valid for price with 9999999" do
        item.price = 9999999
        item.valid?
        expect(item).to be_valid
      end
    end

    context 'can not save' do
      it "is invalid without name" do
        item.name = ""
        item.valid?
        expect(item.errors[:name][0]).to include("入力してください")
      end

      it "is invalid without description" do
        item.description = ""
        item.valid?
        expect(item.errors[:description][0]).to include("入力してください")
      end

      it "is invalid without big_category_id" do
        item.big_category_id = ""
        item.valid?
        expect(item.errors[:big_category_id][0]).to include("入力してください")
      end

      it "is invalid without middle_category_id" do
        item.middle_category_id = ""
        item.valid?
        expect(item.errors[:middle_category_id][0]).to include("入力してください")
      end

      it "is invalid without small_category_id" do
        item.small_category_id = ""
        item.valid?
        expect(item.errors[:small_category_id][0]).to include("入力してください")
      end

      it "is invalid without condition_id" do
        item.condition_id = ""
        item.valid?
        expect(item.errors[:condition_id][0]).to include("入力してください")
      end

      it "is invalid without shipping_cost_id" do
        item.shipping_cost_id = ""
        item.valid?
        expect(item.errors[:shipping_cost_id][0]).to include("入力してください")
      end

      it "is invalid without shipping_method_id" do
        item.shipping_method_id = ""
        item.valid?
        expect(item.errors[:shipping_method_id][0]).to include("入力してください")
      end

      it "is invalid without sender_prefecture" do
        item.sender_prefecture = ""
        item.valid?
        expect(item.errors[:sender_prefecture][0]).to include("入力してください")
      end

      it "is invalid without days_for_shipment_id" do
        item.days_for_shipment_id = ""
        item.valid?
        expect(item.errors[:days_for_shipment_id][0]).to include("入力してください")
      end

      it "is invalid without status_id" do
        item.status_id = ""
        item.valid?
        expect(item.errors[:status_id][0]).to include("入力してください")
      end

      it "is invalid for description with 41 characters or more" do
        item.description = "１２３４５６７８９０１２３４５６７８９０１２３４５６７８９０１２３４５６７８９０１"
        item.valid?
        expect(item.errors[:description][0]).to include("してください")
      end


      it "is invalid for prices below 300" do
        item.price = 299
        item.valid?
        expect(item.errors[:price][0]).to include("以上の値にしてください")
      end

      it "is invalid for prices over 10 million" do
        item.price = 10000000
        item.valid?
        expect(item.errors[:price][0]).to include("以下の値にしてください")
      end
    end
  end
end
