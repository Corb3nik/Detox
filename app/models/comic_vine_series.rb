class ComicVineSeries < ActiveRecord::Base
  validates :name, presence: true
  validates :year, presence: true
  validates :status, presence: true

  attr_accessor :name
  attr_accessor :year
  attr_accessor :publisher
  attr_accessor :status
end
