class Issue < ActiveRecord::Base
  has_one :PendingIssue

  validates :path, presence: true
  validates :filename, presence: true
  validates :name, presence: true

  attr_accessor :path
  attr_accessor :filename
  attr_accessor :name
  attr_accessor :year
  attr_accessor :number
end
