# -*- encoding: utf-8 -*-
# stub: ci_reporter_rspec 1.0.0 ruby lib

Gem::Specification.new do |s|
  s.name = "ci_reporter_rspec".freeze
  s.version = "1.0.0".freeze

  s.required_rubygems_version = Gem::Requirement.new(">= 0".freeze) if s.respond_to? :required_rubygems_version=
  s.require_paths = ["lib".freeze]
  s.authors = ["Nick Sieger".freeze, "Jake Goulding".freeze]
  s.date = "2014-07-24"
  s.email = ["nick@nicksieger.com".freeze, "jake.goulding@gmail.com".freeze]
  s.homepage = "https://github.com/ci-reporter/ci_reporter_rspec".freeze
  s.licenses = ["MIT".freeze]
  s.rubygems_version = "3.4.22".freeze
  s.summary = "Connects CI::Reporter to RSpec".freeze

  s.installed_by_version = "3.4.22".freeze if s.respond_to? :installed_by_version

  s.specification_version = 4

  s.add_runtime_dependency(%q<rspec>.freeze, [">= 2.14".freeze, "< 4".freeze])
  s.add_runtime_dependency(%q<ci_reporter>.freeze, ["~> 2.0".freeze])
  s.add_development_dependency(%q<bundler>.freeze, ["~> 1.6".freeze])
  s.add_development_dependency(%q<rake>.freeze, [">= 0".freeze])
  s.add_development_dependency(%q<ci_reporter_test_utils>.freeze, [">= 0".freeze])
  s.add_development_dependency(%q<rspec-collection_matchers>.freeze, [">= 0".freeze])
end
