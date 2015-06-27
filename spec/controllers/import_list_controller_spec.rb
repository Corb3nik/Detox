require 'rails_helper'

describe ImportListController, type: :controller do

  describe "GET #index" do
    it "renders the index template" do
      get :index
      expect(response).to render_template :index
    end
  end

  describe "POST #import" do
    it "renders the index template" do
      post :import
      expect(response).to render_template :index
    end
  end

  describe "POST #scan" do
    it "renders the index template" do
      post :scan
      expect(response).to render_template :index
    end
  end
end
