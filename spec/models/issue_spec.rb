require 'rails_helper'

describe Issue, type: :model do
  it { should have_one :pending_issue }
  it { should have_one :watched_issue }
  it { should have_many :unmatched_issues }

  it "is invalid without a path" do
    issue = Issue.new filename: "test_filename", name: "test_name"
    expect(issue.valid?).to be false
  end

  it "is invalid without a filename" do
    issue = Issue.new path: "test_path", name: "test_name"
    expect(issue.valid?).to be false
  end

  it "is invalid without a name" do
    issue = Issue.new path: "test_path", filename: "test_filename"
    expect(issue.valid?).to be false
  end
end
