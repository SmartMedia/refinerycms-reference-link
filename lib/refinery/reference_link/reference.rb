

module Refinery
  module ReferenceLink
    class Reference

      attr_reader :title, :object, :html
      def initialize(args = {})
        unless args.key?(:title) and args.key?(:html)
          raise ArgumentError, 'Wrong arguments for Reference, it expects hash with :title and :html.' 
        end
        @title = args[:title]
        @html = args[:html]
      end

      def object
        @object ||= Page.find_by_title(@title)
      end

      def exists?
        return true if object
        return false
      end

      def link
        return nil unless self.exists?
        @object.url
      end

    end
  end
end
