class Import
  def self.import_issue(issue)
    comic_vine_volumes = get_matching_comicvine_volumes_for issue

    comic_vine_volumes.each do |matched_volume|
      IssueManager.add_comic_vine_series ({ id: matched_volume.id, name: matched_volume.name, year: matched_volume.start_year, publisher: matched_volume.publisher.name, status: "N/A" })
    end

    if comic_vine_volumes.cvos.size == 1
      volume = comic_vine_volumes.first.fetch
      volume.get_issues.each do |matched_issue|
        IssueManager.add((issue.id if matched_issue.issue_number.to_i == issue.number),
                         WatchedIssue,
                         { comic_vine_series_id: volume.id,
                           number: matched_issue.issue_number.to_i,
                           name: matched_issue.name,
                           status: (if matched_issue.issue_number.to_i == issue.number then :Downloaded else :Wanted end),
                           cover_date: matched_issue.cover_date })
      end
    else
      comic_vine_volumes.each do |matched_volume|
        IssueManager.add issue.id, UnmatchedIssue, comic_vine_series_id: matched_volume.id
      end
    end
  end

  private

  def self.is_same_name(name1, name2)
    [name1, name2].each do |name|
      name.gsub! /[^\sa-zA-Z1-9]/, ' '
      name.gsub! /\\band\\b|&/i, ' '
      name.squish
    end

    name1 == name2
  end

  def self.get_matching_comicvine_volumes_for(issue)
    results = ComicVine::API.search 'volume', "\"#{issue.name}\""

    if results.total_count > 1
      issue.name.gsub! /\\bthe\\b/i, ' '
      issue.name.squish!

      results.cvos.reject! do |volume|
        volume.name.gsub! /\\bthe\\b/i, ' '
        Rails.logger.info "Comparing Issue : #{issue.name} with #{volume.name}"
        not is_same_name issue.name, volume.name
      end
    end
    results
  end
end
