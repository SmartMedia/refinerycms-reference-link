Gem::Specification.new do |s|
  s.name              = %q{refinerycms-reference-link}
  s.version           = %q{0.0.1}
  s.description       = %q{Wiki like links integration into RefineryCMS.}
  s.date              = %q{2011-06-02}
  s.summary           = %q{Ruby on Rails wiki like links for RefineryCMS.}
  s.email             = %q{retro@ballgag.cz}
  s.homepage          = %q{https://github.com/SmartMedia/refinerycms-reference-link}
  s.authors           = ['Smart Media Agency']
  s.require_paths     = %w(lib)

  s.add_dependency 'nokogiri' 

  s.files             = %w(
    app
    app/models
    app/models/create_reference_link_engine.rb
    readme.md
    spec
    spec/lib
    spec/lib/reference_spec.rb
    spec/lib/formatter_spec.rb
    spec/lib/referencer_spec.rb
    spec/texts
    spec/texts/test.txt
    spec/texts/parsed_test.txt
    spec/models
    spec/models/reference.rb
    lib
    lib/gemspec.rb
    lib/refinerycms-reference-link.rb
    lib/generators
    lib/generators/refinerycms_reference_link_generator.rb
    lib/refinery
    lib/refinery/reference_link
    lib/refinery/reference_link/reference.rb
    lib/refinery/reference_link/formatter.rb
    lib/refinery/reference_link/version.rb
    lib/refinery/reference_link/referencer.rb
  )
  
end
