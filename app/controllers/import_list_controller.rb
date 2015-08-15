class ImportListController < ApplicationController

  def index
    @pending_issues = PendingIssue.includes(:issue).all
    @location = Config.import_location
  end

  def scan
    if params.has_key? :location
      Config.import_location = params[:location]
      @pending_issues = Scan.scan params[:location]
    end

    redirect_to :import_list
  end

  def import
    if params.has_key? :issue_ids
      for issue_id in params[:issue_ids] do
        # TODO : Find all matching issues in the comicvine API

        # TODO : If multiple or no matches are found, create an UnmatchedIssue for each comicvine match

        # TODO : Else, create a WatchedIssue from the comicvine match
        IssueManager.add(issue_id, WatchedIssue)

        # TODO : Perform the import action (move files, copy files, rename files)
        #        Unmatched issues will be moved/copied/renamed to a 'unmatched' folder

        # TODO : Remove the associated Pending Issue
        IssueManager.remove(issue_id, PendingIssue)
      end
    end

    redirect_to :import_list
  end
end
