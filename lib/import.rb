class Import
  def import_issue(issue)
    raise TypeEror, 'issue parameter must be of type Issue' unless issue.class == Issue

    comic_vine_volumes = get_matching_comicvine_volumes issues

    if comic_vine_volumes.size == 1

      comic_vine_volumes.first.get_issues do |matched_issue|
        IssueManager.add issue.id if matched_issue.issue_number == issue.number, WatchedIssue,
          { comic_vine_series_id: matched_issue.volume,
            number: issue.issue_number,
            name: issue.name,
            cover_date: issue.cover_date }
      end
    else
    end
  end

  private

  def is_same_name(name1, name2)

    [name1, name2].each do |name|
      name.gsub! /[^\sa-zA-Z1-9]/, ' '
      name.gsub! /\\band\\b|&/i, ' '
      name.squish
    end

    name1 == name2
  end

  def get_matching_comicvine_volumes(issue)
    results = ComicVine::API.search 'volume', "\"#{issue.name}\""

    if results.size > 1
      issue.name.gsub! /\\bthe\\b/i, ' '
      issue.name.squish!

      results.reject! do |volume|
        volume.name.gsub! /\\bthe\\b/i, ' '
        not is_same_name issue.name, volume.name
      end
    end
  end
end
