module EngineRouter
  module Router
    extend ActiveSupport::Concern

    included do |instance|
      
    end

    module ClassMethods
      def engine_routes
        @engine_routes ||= EngineRouter::Routes.new(self)
      end
    end



  end
end