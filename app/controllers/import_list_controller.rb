class ImportListController < ApplicationController

  def index
    @pending_issues = PendingIssue.includes(:issue).all
  end

  def scan
    @pending_issues = Scan.scan "/Volumes/public/#Detox-Samples/"
    render :index
  end

  def import

    render :index
  end
end
