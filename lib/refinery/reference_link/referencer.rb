module Refinery
  module ReferenceLink
    class Referencer
      
      class << self
        attr_accessor :syntax        
        def syntax
          @syntax ||= /\[\[([^\[\]]+)\/([^\\|[\]]+)\|?([^\[\]]+)?\]\]/
        end
        
        def parse(text)
          data = text.scan Referencer.syntax
          objects = []
          data.each do |d|
            objects << Refinery::ReferenceLink::Reference.new(:model => d[0], :title => d[1], :text => d[2])
          end          
          return objects
        end
        
      end
      
    end
  end
end
