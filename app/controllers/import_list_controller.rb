class ImportListController < ApplicationController

  def index
    @pending_issues = PendingIssue.includes(:issue).all
  end

  def scan
    @pending_issues = Scan.scan params[:location]
    redirect_to :import_list
  end

  def import

    for issue_id in params[:issue_ids] do
      IssueManager.remove(issue_id, from: PendingIssue)
      IssueManager.add(issue_id, to: WatchedIssue)
    end
    redirect_to :import_list
  end
end
