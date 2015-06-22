require 'rails_helper'

describe UnmatchedIssue, type: :model do
  it { should belong_to :issue }
  it { should belong_to :comic_vine_series }

  it "is invalid without issue id" do
    unmatched_issue = FactoryGirl.build :unmatched_issue, issue_id: nil
    expect(unmatched_issue.valid?).to be false
  end
end
