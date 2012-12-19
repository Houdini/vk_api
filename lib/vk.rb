require 'rubygems'
require 'vk/configuration'
require 'vk/api'
require 'vk/client'
require 'vk/api_params'
require 'vk/errors'

module Vk
  extend Configuration
  extend ApiParams
  class << self
    def new options = {}
      if options.is_a? String
        Vk::Client.new :access_token => options
      elsif options.is_a? Hash
        Vk::Client.new options
      else
        raise ArgumentError
      end
    end
  end
end
