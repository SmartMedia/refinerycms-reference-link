require 'nokogiri'

module Refinery
  module ReferenceLink
    class Formatter
      include ActionDispatch::Routing::UrlFor
      include Rails.application.routes.url_helpers

      attr_reader :text

      def to_html(reference)
        url = url_for(reference.link.merge({:only_path => true})) rescue nil
        refs = @doc.css('a').select {|el| (el.keys == reference.html.keys) and (el.children.to_s == reference.html.children.to_s)}
        refs.each do |ref|
          unless ref['href'] and ref['href'][0] == 35
            ref['href'] = url.to_s
            # ref.remove_attribute('data-model')
            # ref.remove_attribute('data-page')
            # ref['class'] = ref['class'].gsub('reference-link', '')
            # ref.remove_attribute('class') if ref['class'].empty?

            ref.replace ref.children.to_s if url.blank?
          end
        end

      end

      def initialize(text)
        @text = text
        @doc = ::Nokogiri::HTML(@text)
        references = Refinery::ReferenceLink::Referencer.parse(text)
        references.each do |reference|
          to_html(reference) 
        end
        @text = @doc.css('body').children.to_s
      end

      def self.parse(text)
        ::Refinery::ReferenceLink::Formatter.new(text).text
      end

    end
  end
end
