class UnmatchedListController < ApplicationController

  def index
    @unmatched_issues = UnmatchedIssue.all
  end
end
