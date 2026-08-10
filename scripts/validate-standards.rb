#!/usr/bin/env ruby

require "pathname"
require "yaml"

ROOT = Pathname(__dir__).parent
errors = []
rule_ids = {}

markdown_files = Dir[ROOT.join("**/*.md").to_s].reject do |path|
  path.include?("/.git/")
end

markdown_files.each do |absolute_path|
  file = Pathname(absolute_path).relative_path_from(ROOT).to_s
  content = File.read(absolute_path)

  content.scan(/^### ([A-Z][A-Z0-9]*-[0-9]{3}) — .+$/).flatten.each do |rule_id|
    if rule_ids.key?(rule_id)
      errors << "duplicate rule ID #{rule_id}: #{rule_ids[rule_id]} and #{file}"
    else
      rule_ids[rule_id] = file
    end
  end

  content.scan(/\]\(([^)]+)\)/).flatten.each do |link|
    next if link.start_with?("http://", "https://", "mailto:", "#")

    target = link.split("#", 2).first
    next if target.empty?

    target_path = (Pathname(absolute_path).dirname + target).cleanpath
    errors << "missing link target in #{file}: #{link}" unless target_path.exist?
  end
end

%w[docs/standards docs/profiles].each do |directory|
  Dir[ROOT.join(directory, "*.md").to_s].each do |absolute_path|
    file = Pathname(absolute_path).relative_path_from(ROOT).to_s
    content = File.read(absolute_path)
    sections = content.split(/^### /).drop(1)

    sections.each do |section|
      next unless section.match?(/^[A-Z][A-Z0-9]*-[0-9]{3} — /)

      %w[Applicability Strength Rule Evidence Verification].each do |field|
        errors << "#{file}: rule section is missing #{field}" unless section.include?("- **#{field}:**")
      end
    end
  end
end

begin
  YAML.load_file(ROOT.join("docs/templates/project-standards.yml"))
rescue Psych::Exception => error
  errors << "invalid project standards template: #{error.message}"
end

if errors.empty?
  puts "Standards validation passed (#{rule_ids.length} rules)."
else
  warn errors.join("\n")
  exit 1
end
