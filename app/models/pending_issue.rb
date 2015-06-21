class PendingIssue < ActiveRecord::Base
  belongs_to :issue

  validates :issue_id, presence: true
end
