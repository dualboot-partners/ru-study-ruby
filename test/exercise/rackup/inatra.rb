module Inatra
  class << self
    def routes(&block)
      @storage = {}
      instance_eval(&block)
    end

    def call(env)   	
      req = Rack::Request.new(env)
      path_info = req.path_info
      request_method = req.request_method.downcase.to_sym
      return [404,{},['No']] unless @storage[request_method].key?(path_info)
      @storage[request_method][path_info].call(env)
    end

    def get(path, &block)
      stor(__method__, path, &block)
    end

    def post(path, &block)
      stor(__method__, path, &block)
    end

    def delete(path, &block)
      stor(__method__, path, &block)
    end

    def put(path, &block)
      stor(__method__, path, &block)
    end

    private
    def stor(meth, path, &block)
      @storage[meth] = {}
      @storage[meth][path] = block
    end
  end
end