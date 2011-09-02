require 'nokogiri'

module Refinery
  module ReferenceLink
    class Formatter
      include ActionDispatch::Routing::UrlFor
      include Rails.application.routes.url_helpers

      attr_reader :text

      def to_html(reference)
        url = url_for(reference.link.merge({:only_path => true})) rescue nil
        refs = @doc.css('a[href]').select {|el| el.to_s == reference.html.to_s}

        refs.each do |ref|
          unless ref['href'] and ref['href'][0] == 35
            ref['href'] = url.to_s
            # ref.remove_attribute('data-model')
            # ref.remove_attribute('data-page')
            # ref['class'] = ref['class'].gsub('reference-link', '')
            # ref.remove_attribute('class') if ref['class'].empty?
            if reference.object.try(:'dictionary?')           
              ref['class'] = 'di'
              if reference.object.parts.any?
                ref['title'] = Nokogiri::HTML.parse(reference.object.parts.try(:first).body).tap{|n| n.encoding = 'UTF-8'}.css('p').first.text.delete("\r").delete("\n").delete("\t")
              end
            end
            ref.replace ref.children.to_s if url.blank? or !reference.object.try(:'live?')
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
        @doc.encoding = 'UTF-8'
        @text = @doc.css('body').children.to_s
      end

      def self.parse(text)
        ::Refinery::ReferenceLink::Formatter.new(text).text
      end

    end
  end
end
