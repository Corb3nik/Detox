require 'rails_helper'

describe WatchlistController, type: :controller do
  before :each do
    @watched_issue = FactoryGirl.create :watched_issue
  end

  describe "GET #index" do
    it "renders the index template" do
      get :index
      expect(response).to render_template :index
    end
  end

  describe "GET #show" do
    it "renders the show template" do
      get :show, id: @watched_issue.comic_vine_series_id
      expect(response).to render_template :show
    end
  end

  describe "DELETE #destroy" do
    it "redirects to #index" do
      delete :destroy, id: @watched_issue.comic_vine_series_id
      expect(response).to redirect_to watchlist_path
    end
  end

