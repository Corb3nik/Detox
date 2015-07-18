class ImportListController < ApplicationController

  def index
    @pending_issues = PendingIssue.includes(:issue).all
  end

  def scan
    if params.has_key? :location
      @pending_issues = Scan.scan params[:location]
    end

    redirect_to :import_list
  end

  def import
    if params.has_key? :issue_ids
      for issue_id in params[:issue_ids] do
        IssueManager.remove(issue_id, from: PendingIssue)
        IssueManager.add(issue_id, to: WatchedIssue)
      end
    end

    redirect_to :import_list
  end
end
