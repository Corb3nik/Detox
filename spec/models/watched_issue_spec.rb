require 'rails_helper'

describe WatchedIssue, type: :model do

  it { should belong_to :comic_vine_series }
  it { should belong_to :issue }

  it "is invalid without a comic vine series id" do
    watched_issue = FactoryGirl.build :watched_issue, comic_vine_series_id: nil
    expect(watched_issue.valid?).to be false
  end

  it "is invalid without an issue id" do
    watched_issue = FactoryGirl.build :watched_issue, issue_id: nil
    expect(watched_issue.valid?).to be false
  end

  it "is invalid without a number" do
    watched_issue = FactoryGirl.build :watched_issue, number: nil
    expect(watched_issue.valid?).to be false
  end

  it "is invalid without a status" do
    watched_issue = FactoryGirl.build :watched_issue, status: nil
    expect(watched_issue.valid?).to be false
  end
end
