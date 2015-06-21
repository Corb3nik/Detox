require 'rails_helper'

describe WatchedIssue, type: :model do

  before :each do
    @issue = Issue.create path: "test_path", filename: "test_filename", name: "test_name"
    @comic_vine_series = ComicVineSeries.create name: "test_name", year: "test_year", status: "test_status"
  end

  it { should belong_to :comic_vine_series }
  it { should belong_to :issue }

  it "is invalid without a comic vine series id" do
    watched_issue = @issue.build_watched_issue number: 1, status: "test_status"
    expect(watched_issue.valid?).to be false
  end

  it "is invalid without an issue id" do
    watched_issue = @comic_vine_series.watched_issues.build number: 1, status: "test_status"
    expect(watched_issue.valid?).to be false
  end

  it "is invalid without a number" do
    watched_issue = @issue.build_watched_issue status: "test_status"
    @comic_vine_series.watched_issues << watched_issue
    expect(watched_issue.valid?).to be false
  end

  it "is invalid without a status" do
    watched_issue = @issue.build_watched_issue number: 1
    @comic_vine_series.watched_issues << watched_issue
    expect(watched_issue.valid?).to be false
  end
end
