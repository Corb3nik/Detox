class WatchlistController < ApplicationController
  def index
  end

  def show
  end

  def destroy
    redirect_to watchlist_path
  end
end
