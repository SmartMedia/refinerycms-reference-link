module Refinery
  module ReferenceLink
    class Formatter
      include ActionDispatch::Routing::UrlFor
      include Rails.application.routes.url_helpers    
      
      attr_reader :text
      
      def link_to(title, url)
        "<a href=\"#{url}\">#{title}</a>"
      end
      
      def initialize(text)
        @text = text
        references = Refinery::ReferenceLink::Referencer.parse(text)
        references.each do |reference|
          @text.gsub!(reference.original, link_to(reference.text ? reference.text : reference.title, url_for(reference.link.merge({:only_path => true}))))
        end
      end
      
      def self.parse(text)
        ::Refinery::ReferenceLink::Formatter.new(text).text
      end
      
    end
  end
end
