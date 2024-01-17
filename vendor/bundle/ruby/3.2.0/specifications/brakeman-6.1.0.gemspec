# -*- encoding: utf-8 -*-
# stub: brakeman 6.1.0 ruby lib

Gem::Specification.new do |s|
  s.name = "brakeman".freeze
  s.version = "6.1.0".freeze

  s.required_rubygems_version = Gem::Requirement.new(">= 0".freeze) if s.respond_to? :required_rubygems_version=
  s.metadata = { "bug_tracker_uri" => "https://github.com/presidentbeef/brakeman/issues", "changelog_uri" => "https://github.com/presidentbeef/brakeman/releases", "documentation_uri" => "https://brakemanscanner.org/docs/", "homepage_uri" => "https://brakemanscanner.org/", "mailing_list_uri" => "https://gitter.im/presidentbeef/brakeman", "source_code_uri" => "https://github.com/presidentbeef/brakeman", "wiki_uri" => "https://github.com/presidentbeef/brakeman/wiki" } if s.respond_to? :metadata=
  s.require_paths = ["lib".freeze]
  s.authors = ["Justin Collins".freeze]
  s.date = "2023-12-05"
  s.description = "Brakeman detects security vulnerabilities in Ruby on Rails applications via static analysis.".freeze
  s.email = "gem@brakeman.org".freeze
  s.executables = ["brakeman".freeze]
  s.files = ["bin/brakeman".freeze]
  s.homepage = "https://brakemanscanner.org".freeze
  s.licenses = ["Brakeman Public Use License".freeze]
  s.required_ruby_version = Gem::Requirement.new(">= 3.0.0".freeze)
  s.rubygems_version = "3.4.22".freeze
  s.summary = "Security vulnerability scanner for Ruby on Rails.".freeze

  s.installed_by_version = "3.4.22".freeze if s.respond_to? :installed_by_version
end
