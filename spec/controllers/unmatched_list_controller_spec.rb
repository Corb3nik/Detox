require 'rails_helper'

describe UnmatchedListController, type: :controller do
  before :each do
    @unmatched_issue = FactoryGirl.create :unmatched_issue
  end

  describe "Get #index" do
    it "renders the index template" do
      get :index
      expect(response).to render_template :index
    end
  end

  describe "Get #match" do
    it "renders the match template" do
      get :match, id: @unmatched_issue.id
      expect(response).to render_template :match
    end
  end
end
