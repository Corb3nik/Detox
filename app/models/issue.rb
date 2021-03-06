class Issue < ActiveRecord::Base
  has_one :pending_issue, dependent: :destroy
  has_one :watched_issue, dependent: :destroy
  has_many :unmatched_issues, dependent: :destroy

  validates :path, presence: true
  validates :filename, presence: true
  validates :name, presence: true
  validates_uniqueness_of :filename, scope: :path

  def self.create_pending_issue(path, filename, name, year, issue_number)
    issue = Issue.create path: path,
        filename: filename,
        name: name,
        year: year,
        number: issue_number

    issue.create_pending_issue
  end
end
