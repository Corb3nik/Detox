FactoryGirl.define do
  factory :watched_issue do
    comic_vine_series
    issue
    number 1
    status "test_status"
  end
end
