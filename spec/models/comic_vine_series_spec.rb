require 'rails_helper'

describe ComicVineSeries, type: :model do
  it { should have_many :unmatched_issues }
  it { should have_many :watched_issues }

  it "is invalid without name" do
    comic_vine_series = ComicVineSeries.new year: "test_year", status: "test_status"
    expect(comic_vine_series.valid?).to be false
  end

  it "is invalid without year" do
    comic_vine_series = ComicVineSeries.new name: "test_name", status: "test_status"
    expect(comic_vine_series.valid?).to be false
  end

  it "is invalid without status" do
    comic_vine_series = ComicVineSeries.new name: "test_name", status: "test_year"
    expect(comic_vine_series.valid?).to be false
  end
end
