module EngineRouter
  class Routes

    def initialize (engine)
      @engine = engine
      clear_routes
    end

    def engine
      @engine
    end

    def prepend &block
      unless prepend_routes.include?(block)
        @prepend_routes << block
      end
    end

    def append &block
      unless append_routes.include?(block)
        @append_routes << block
      end
    end

    def draw &block
      prepend_routes.each { |r| eval_block(&r) }
      eval_block(&block) if block_given?
      append_routes.each { |r| eval_block(&r) }
      # Clear out routes so that they aren't drawn twice.
      clear_routes
    end

    def eval_block(&block)
      engine.routes.send(:eval_block,block)
    end

    def clear_routes
      @prepend_routes = []
      @append_routes = []
    end

    private

    def prepend_routes
      @prepend_routes ||= []
    end

    def append_routes
      @append_routes ||= []
    end



  end
end

