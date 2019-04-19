require 'rails_helper'
require 'pry'

describe ItemsController do
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
  let(:item) {create(:item,
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
      item_images_attributes: [{image: image}, {image: image}]
      )}
  let(:item_params) {{
      brand_name: brand.name,
      id: item.id,
      item: {
        id: item.id,
        seller_id: user.id,
        big_category_id: big_category.id,
        middle_category_id: middle_category.id,
        small_category_id: small_category.id,
        brand_name: brand.name,
        condition_id: condition.id,
        shipping_cost_id: shipping_cost.id,
        shipping_method_id: shipping_method.id,
        days_for_shipment_id: days_for_shipment.id,
        status_id: status.id,
        price: 1000,
        item_images_attributes: [{image: image}]
      }
    }}

  describe 'GET #show' do
    before do
      login_user user
    end
    it "assigns the requested item to @item" do
      get :show, params: { id: item.id }
      expect(assigns(:item)).to eq item
    end

    it "renders the :show templete" do
      get :show, params: { id: item.id }
      expect(response).to render_template :show
    end
  end

  describe 'GET #edit' do
    before do
      login_user user
    end
    it "assigns the requested item to @item" do
      get :edit, params: { id: item.id }
      expect(assigns(:item)).to eq item
    end

    it "renders the :edit templete" do
      get :edit, params: { id: item.id }
      expect(response).to render_template :edit
    end
  end

  describe 'PUT #update' do
    before do
      login_user user
    end
    it "assigns the requested item to @item" do
      put :update, params: item_params
      expect(assigns(:item)).to eq item
    end

    it "renders the :update templete" do
      put :update, params: item_params
      expect(response).to render_template :show
    end

    it "redirect to item_edit_path due to update failure" do
      item_params[:item][:price] = "test for redirect"
      put :update, params: item_params
      expect(response).to redirect_to edit_item_path(item)
    end
  end
end
