class IssueManager
  def self.remove(issue_id, from)
    from.find(issue_id).destroy
  end

  def self.add(issue_id, to, options = {})
    options[:issue_id] = issue_id
    to.create! options
  end

  def self.add_comic_vine_series(options)
    ComicVineSeries.create options
  end
end
