module Refinery
  module ReferenceLink
    class Formatter
      include ActionDispatch::Routing::UrlFor
      include Rails.application.routes.url_helpers    
      
      attr_reader :text
      
      def to_html(reference)
        text = reference.text ? reference.text : reference.title
        url = url_for(reference.link.merge({:only_path => true})) rescue nil
        @text.gsub!(reference.original, link_to_if(text, url, reference.exists?))
        
      end
      
      def link_to_if(title, url, link)
        link ? "<a href=\"#{url}\">#{title}</a>" : title
      end
      
      def initialize(text)
        @text = text
        references = Refinery::ReferenceLink::Referencer.parse(text)
        references.each do |reference|
          to_html(reference) 
        end
      end
      
      def self.parse(text)
        p ::Refinery::ReferenceLink::Formatter.new(text).text
        ::Refinery::ReferenceLink::Formatter.new(text).text
      end
      
    end
  end
end
