require 'rails_helper'

describe ComicVineSeries, type: :model do
  it { should have_many :unmatched_issues }
  it { should have_many :watched_issues }

  it "is invalid without name" do
    comic_vine_series = FactoryGirl.build :comic_vine_series, name: nil
    expect(comic_vine_series.valid?).to be false
  end

  it "is invalid without year" do
    comic_vine_series = FactoryGirl.build :comic_vine_series, year: nil
    expect(comic_vine_series.valid?).to be false
  end

  it "is invalid without status" do
    comic_vine_series = FactoryGirl.build :comic_vine_series, status: nil
    expect(comic_vine_series.valid?).to be false
  end
end
