Gem::Specification.new do |s|
  s.name              = %q{refinerycms-reference-link}
  s.version           = %q{0.0.1}
  s.description       = %q{Wiki like links integration into RefineryCMS.}
  s.date              = %q{2011-05-27}
  s.summary           = %q{Ruby on Rails wiki like links engine for RefineryCMS.}
  s.email             = %q{retro@ballgag.cz}
  s.homepage          = %q{https://github.com/SmartMedia/refinerycms-reference-link}
  s.authors           = ['Smart Media Agency']
  s.require_paths     = %w(lib)

  # Runtime dependencies
  s.add_dependency    'refinerycms-core',   '~> 1.0.0'

  s.files             = %w(
    lib
    lib/gemspec.rb
    lib/refinery
    lib/refinery/reference_link
    lib/refinery/reference_link/version.rb
  )
  
end
