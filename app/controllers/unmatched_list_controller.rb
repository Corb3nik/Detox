class UnmatchedListController < ApplicationController

  def index
    @unmatched_issues = UnmatchedIssue.all
  end

  def match
    if params[:current_id].nil? and URI(request.referer).path == unmatched_list_match_path
      redirect_to action: :index
      return
    end

    params[:current_id] ||= params[:issue_ids].first
    @issue = Issue.find(params[:current_id])
    @unmatched_entries = UnmatchedIssue.where(issue_id: @issue.id)
  end
end
