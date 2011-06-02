require 'nokogiri'

module Refinery
  module ReferenceLink
    class Referencer
      
      class << self 
        
        def parse(text)
          objects = []
          
          doc = ::Nokogiri::HTML(text)
          doc.css('a.reference-link').each do |link|
            objects << Refinery::ReferenceLink::Reference.new(:model => link['data-model'], :title => link['data-page'], :text => link.children.to_s, :html => link)
            
          end
          return objects
        end
        
      end
      
    end
  end
end
