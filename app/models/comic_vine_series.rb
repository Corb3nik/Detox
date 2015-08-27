class ComicVineSeries < ActiveRecord::Base
  has_many :unmatched_issues, dependent: :destroy
  has_many :watched_issues, dependent: :destroy

  validates :name, presence: true
  validates :year, presence: true
  validates :status, presence: true
end
