require 'rails_helper'

describe UnmatchedListController, type: :controller do

  describe "Get #index" do
    it "renders the index template" do
      get :index
      expect(response).to render_template :index
    end
  end
end
