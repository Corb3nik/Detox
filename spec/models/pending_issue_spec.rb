require 'rails_helper'

describe PendingIssue, type: :model do
  it { should belong_to :issue }

  it "is invalid without issue id" do
    pending_issue = FactoryGirl.build :pending_issue, issue_id: nil
    expect(pending_issue.valid?).to be false
  end
end
