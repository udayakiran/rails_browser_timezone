# -*- encoding: utf-8 -*-
$:.push File.expand_path("../lib", __FILE__)
require "rails_browser_timezone/version"

Gem::Specification.new do |s|
  s.name        = "rails_browser_timezone"
  s.version     = RailsBrowserTimezone::VERSION
  s.authors     = ["Udaya Kiran"]
  s.email       = ["udaykiran.vit@gmail.com"]
  s.homepage    = ""
  s.summary     = %q{Rails Browser Timezone client gem}
  s.description = %q{Simple code to detect browser time zone and handle it in rails app}
  
  s.rubyforge_project = "rails_browser_timezone"

  s.files         = %w[
    Gemfile
    README
    lib/browser_timezone_filter.rb
    lib/rails_browser_timezone/version.rb
    rails_browser_timezone.gemspec
  ]
  s.require_paths = ["lib"]

  s.add_runtime_dependency "activesupport", '~> 2'
end
