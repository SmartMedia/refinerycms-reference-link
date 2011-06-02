require 'refinerycms-base'

module Refinery
  module ReferenceLink
    autoload :Version, File.expand_path('../refinery/reference_link/version', __FILE__)  
    autoload :Referencer, File.expand_path('../refinery/reference_link/referencer', __FILE__)      
    autoload :Reference, File.expand_path('../refinery/reference_link/reference', __FILE__)          
    autoload :Formatter, File.expand_path('../refinery/reference_link/formatter', __FILE__)              
    class Engine < Rails::Engine
      config.to_prepare do
        module ::Refinery
          class << self
            attr_accessor :referenceable_models

            def referenceable_models
              @referenceable_models ||= [Page]
            end
          end
        end
      end    
      
      initializer "static assets" do |app|
        app.middleware.insert_after ::ActionDispatch::Static, ::ActionDispatch::Static, "#{root}/public"
      end

      config.after_initialize do
        Refinery::Plugin.register do |plugin|
          plugin.name = "reference_link"
          plugin.hide_from_menu = true
        end
      end
    end
  end
end
