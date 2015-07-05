class ImportListController < ApplicationController

  def index
    @pending_issues = PendingIssue.includes(:issue).all
  end

  def scan
    @pending_issues = Scan.scan "/Volumes/public/#Detox-Samples/"
    redirect_to :import_list
  end

  def import

    render :index
  end
end
