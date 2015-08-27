class WatchedIssue < ActiveRecord::Base
  belongs_to :comic_vine_series
  belongs_to :issue

  validates :comic_vine_series_id, presence: true
  # TODO : Add proper validation
  # validates :issue_id, presence: true
  validates :number, presence: true
  # TODO : Add proper validation
  # validates :status, presence: true
end
