class ComicVineSeries < ActiveRecord::Base
  has_many :unmatched_issues
  has_many :watched_issues

  validates :name, presence: true
  validates :year, presence: true
  validates :status, presence: true
end
