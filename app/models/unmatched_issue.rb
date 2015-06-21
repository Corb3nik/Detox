class UnmatchedIssue < ActiveRecord::Base
  belongs_to :issue
  belongs_to :comic_vine_series

  validates :issue_id, presence: true
end
