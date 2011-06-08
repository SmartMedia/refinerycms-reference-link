require 'nokogiri'

module Refinery
  module ReferenceLink
    class Referencer
      class << self 
        def parse(text)
          objects = []
          doc = ::Nokogiri::HTML(text)
          doc.css('a').each do |link|
            if link['href'].match(%r{^[^:\/.-]*$})
              objects << Refinery::ReferenceLink::Reference.new(:title => link['href'], :html => link)
            end
          end
          return objects
        end
      end
    end
  end
end
