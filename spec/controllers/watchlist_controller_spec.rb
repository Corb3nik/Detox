require 'rails_helper'

describe WatchlistController, type: :controller do

  before :each do
    @comic_vine_series = ComicVineSeries.create name: "test_name", year: "test_year", status: "test_status"
    @watched_issue = @comic_vine_series.watched_issues.create number: 1, status: "test_status"
  end

  describe "GET #index" do
    it "renders the index template" do
      get :index
      expect(response).to render_template :index
    end
  end

  describe "GET #show" do
    it "renders the show template" do
      get :show, id: @comic_vine_series.id
      expect(response).to render_template :show
    end
  end

  describe "GET #delete" do
    it "renders the delete template" do
      get :delete, id: @comic_vine_series.id
      expect(response).to render_template :delete
    end
  end

  describe "DELETE #destroy" do
    it "redirects to #index" do
      delete :destroy, id: @comic_vine_series.id
      expect(response).to redirect_to(:index)
    end
  end
end
