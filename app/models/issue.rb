class Issue < ActiveRecord::Base
  has_one :pending_issue
  has_one :watched_issue
  has_many :unmatched_issues

  validates :path, presence: true
  validates :filename, presence: true
  validates :name, presence: true
end
