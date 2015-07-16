class IssueManager
  def self.remove(issue_id, from)
    from.find(issue).destroy
  end

  def self.add(issue_id, to, options = {})
    options[:issue_id] = issue_id
    to.create(options)
end
