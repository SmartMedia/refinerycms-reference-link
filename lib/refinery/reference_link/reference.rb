module Refinery
  module ReferenceLink
    class Reference
    
      attr_reader :model, :title, :text, :object
      def initialize(args = {})
        unless args.key?(:model) and args.key?(:title)
          raise ArgumentError, 'Wrong arguments for Reference, it expects hash with :model, :title and :text key.' 
        end
        @model = args[:model]
        @title = args[:title]
        @text  = args[:text]
      end
      
      def object
        @object ||= @model.constantize.find_by_title(@title)
      end
      
      def original
        text = "[[#{@model}/#{@title}"
        text << "|#{@text}" if @text
        text << "]]"
      end
      
      def exists?
        raise StandardError, "Model #{@model} is not referenceable" unless ::Refinery.referenceable_models.collect(&:to_s).include?(@model)
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
