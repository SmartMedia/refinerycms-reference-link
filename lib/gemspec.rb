#!/usr/bin/env ruby
require File.expand_path('../refinery/reference_link/version', __FILE__)
version = ::Refinery::ReferenceLink::Version.to_s
raise "Could not get version so gemspec can not be built" if version.nil?
files = Dir.glob("**/*").flatten.reject do |file|
  file =~ /\.gem(spec)?$/
end

gemspec = <<EOF
Gem::Specification.new do |s|
  s.name              = %q{refinerycms-reference-link}
  s.version           = %q{#{version}}
  s.description       = %q{Wiki like links integration into RefineryCMS.}
  s.date              = %q{#{Time.now.strftime('%Y-%m-%d')}}
  s.summary           = %q{Ruby on Rails wiki like links for RefineryCMS.}
  s.email             = %q{retro@ballgag.cz}
  s.homepage          = %q{https://github.com/SmartMedia/refinerycms-reference-link}
  s.authors           = ['Smart Media Agency']
  s.require_paths     = %w(lib)

  s.files             = %w(
    #{files.join("\n    ")}
  )
  #{"s.test_files        = %w(
    #{Dir.glob("test/**/*.rb").join("\n    ")}
  )" if File.directory?("test")}
end
EOF

File.open(File.expand_path("../../refinerycms-reference-link.gemspec", __FILE__), 'w').puts(gemspec)
