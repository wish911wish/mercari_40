require 'rails_helper'
require 'pry'

describe ItemsController do
  let(:user) {create(:user)}
  let(:item) {create(:item, seller_id: user.id, item_images_attributes: [{image: image}] )}
  let(:image_path) { File.join(Rails.root, 'spec/fixtures/image.jpg') }
  let(:image) { Rack::Test::UploadedFile.new(image_path)}
  let(:item_images_attributes) { {item_images_attributes: [{image: image}]} }
  let(:update_params) {
    {
      brand_name: Brand.all.sample.name,
      id: item.id,
      item: attributes_for(:item)
    }
  }

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
      put :update, params: update_params
      expect(assigns(:item)).to eq item
    end

    it "renders the :update templete" do
      put :update, params: update_params
      expect(response).to render_template :show
    end

    it "redirect to item_edit_path due to update failure" do
      update_params[:item][:price] = "test for redirect"
      put :update, params: update_params
      expect(response).to redirect_to edit_item_path(item)
    end
  end

  describe 'GET #search' do
    it "assigns the requested item to @item" do
      items = create_list(:item, 3, seller_id: user.id, item_images_attributes: [{image: image}])
      get :search
      expect(assigns(:item)).to match(items.sort{ |a, b| b.created_at <=> a.created_at })
    end

    it "renders the :search templete" do
      get :search
      expect(response).to render_template :search
    end
  end

  describe 'POST #detail_search' do
    it "renders the :search templete" do
      post :detail_search, params: attributes_for(:detail_search_params, keyword: "test")
      expect(response).to render_template :search
    end
  end
end
