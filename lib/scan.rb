class Scan
  def self.extensions
    ['.cbr', '.cbz']
  end

  def self.invalid_end_characters
    ['-']
  end

  def self.skip_words
    ['volume', 'episode', 'c2c', 'digital exclusive edition']
  end

  def self.remove_extensions(name)
    extensions.each do |extension|
      name = name.sub extension, ''
    end
    name.strip
  end

  def self.replace_underscores(name)
    name.gsub('_', ' ')
  end

  def self.extract_year(name)
    name.match /[^a-zA-Z\d\s](19|20)[0-9]{2}[^a-zA-Z\d\s]/ do |m|
      return m[0][1..-2]
    end
  end

  def self.remove_skip_words(name)
    skip_words.each do |word|
      name = name.sub /#{word}/i, ''
    end
    name
  end

  def self.remove_extra_spaces(name)
    name.gsub /\s+/, ' '
  end

  def self.extract_volume_number(name)
    name.match /(v\.*\s*[0-9]+)|(vol\.*\s*[0-9]+)/i do |m|
      return m[0].match(/[0-9]+/)[0]
    end
  end

  def self.extract_issue_number(name)
    issue_number = nil
    name.scan /(?=([^0-9a-zA-Z]([0-9]+)([^0-9a-zA-Z]|$)))/ do |s|
      if s[1].to_i < 1900
        issue_number = s[1]
      end
    end
    issue_number
  end

  def self.remove_extras(name)
    name.gsub /[\[\]\(\)].*/, ''
  end

  def self.scan(folder)
    issues_in(folder).each do |file|
      issue = File.basename file

      # Remove garbage
      issue = remove_extensions issue
      issue = remove_skip_words issue

      # Extract year
      if year = extract_year(issue)
        issue = issue.sub year, ''
      end

      # Extract volume
      if volume = extract_volume_number(issue)
        issue = issue.sub /v\.*\s*#{volume}|(vol\.*\s*#{volume})/, ''
      end

      # Remove more garbage (Must be called between volume and issue_number)
      issue = remove_extras issue

      # Extract issue number
      if issue_number = extract_issue_number(issue)
        issue = issue.sub /.#{issue_number}/, ''
      end

      # Remove extra spaces
      issue = remove_extra_spaces issue

      # Analyze results
      if volume && volume.match(/^(20|19)[0-9]{2}$/)
        year ||= volume
      elsif volume && issue_number.nil?
        issue_number = volume
      end

      # Create pending issue
      Issue.create_pending_issue File.dirname(file),
          File.basename(file),
          issue.strip,
          year,
          issue_number.sub!(/^0*/, "") if issue_number
    end
  end

  def self.issues_in(folder)
    files = []
    extensions.each do |extension|
      files.concat Dir.glob "#{folder}/**/*#{extension}"
    end
    files
  end
end
