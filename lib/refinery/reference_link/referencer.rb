require 'nokogiri'

module Refinery
  module ReferenceLink
    class Referencer
      class << self 
        def parse(text)
          objects = []
          doc = ::Nokogiri::HTML(text)
          doc.encoding = 'UTF-8'
          doc.css('a').each do |link|
            if link['href'] and !link['href'].match(%r{^http:\/\/.+\..+$}) # all props to jschoolcraft
              objects << Refinery::ReferenceLink::Reference.new(:title => link['href'].gsub("http://", ""), :html => link)
            end
          end
          return objects
        end
      end
    end
  end
end
