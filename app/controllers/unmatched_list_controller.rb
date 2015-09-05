class UnmatchedListController < ApplicationController

  def index
    @unmatched_issues = UnmatchedIssue.all
  end

  def match
  end
end
