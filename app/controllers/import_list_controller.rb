class ImportListController < ApplicationController

  def index
    Rails.logger.info Scan.scan "/Volumes/public/#Detox-Samples/"
  end

  def scan

    render :index
  end

  def import

    render :index
  end
end
