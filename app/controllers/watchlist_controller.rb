class WatchlistController < ApplicationController
  def index
    @comic_vine_series = ComicVineSeries.includes(:watched_issues).where.not(watched_issues: {comic_vine_series_id: nil})
  end

  def show
  end

  def destroy

    render :index
  end
end
