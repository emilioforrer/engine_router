module EngineRouter
  module Base
    extend ActiveSupport::Concern

    included do |instance|
      
    end

    module ClassMethods
      def acts_as_engine_router
        self.send(:include,EngineRouter::Router) 
      end
    end

  end
end
::Rails::Engine.send(:include, EngineRouter::Base)
