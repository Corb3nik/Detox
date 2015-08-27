class Import
  def self.import_issue(issue)
    raise TypeEror, 'issue parameter must be of type Issue' unless issue.class == Issue

    comic_vine_volumes = get_matching_comicvine_volumes issue

    if comic_vine_volumes.cvos.size == 1

      volume = comic_vine_volumes.first.fetch
      volume.get_issues.each do |matched_issue|
        IssueManager.add((issue.id if matched_issue.issue_number.to_i == issue.number),
                         WatchedIssue,
                         { comic_vine_series_id: matched_issue.volume.id,
                           number: matched_issue.issue_number.to_i,
                           name: matched_issue.name,
                           status: (if matched_issue.issue_number.to_i == issue.number then :Downloaded else :Wanted end),
                           cover_date: matched_issue.cover_date })
      end
    else
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

  def self.get_matching_comicvine_volumes(issue)
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
