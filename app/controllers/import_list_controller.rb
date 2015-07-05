class ImportListController < ApplicationController

  def index
    @pending_issues = PendingIssue.includes(:issue).all
  end

  def scan
    @pending_issues = Scan.scan params[:location]
    redirect_to :import_list
  end

  def import

    redirect_to :import_list
  end
end
