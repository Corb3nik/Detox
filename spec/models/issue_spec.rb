require 'rails_helper'

describe Issue, type: :model do
  it { should have_one :pending_issue }
  it { should have_one :watched_issue }
  it { should have_many :unmatched_issues }

  it "is invalid without a path" do
    issue = FactoryGirl.build :issue, path: nil
    expect(issue.valid?).to be false
  end

  it "is invalid without a filename" do
    issue = FactoryGirl.build :issue, filename: nil
    expect(issue.valid?).to be false
  end

  it "is invalid without a name" do
    issue = FactoryGirl.build :issue, name: nil
    expect(issue.valid?).to be false
  end
end
