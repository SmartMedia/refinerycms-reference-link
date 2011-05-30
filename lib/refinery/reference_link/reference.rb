module Refinery
  module ReferenceLink
    class Reference
    
      attr_reader :model, :title, :text
      def initialize(args = {})
        unless args.key?(:model) and args.key?(:title)
          raise ArgumentError, 'Wrong arguments for Reference, it expects hash with :model, :title and :text key.' 
        end
        @model = args[:model]
        @title = args[:title]
        @text  = args[:text]
      end
      
      def original
        text = "[[#{@model}/#{@title}"
        text << "|#{@text}" if @text
        text << "]]"
      end
      
    end
  end
end
