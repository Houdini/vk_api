require 'rubygems'
require 'vk/configuration'
require 'vk/api'
require 'vk/client'

module Vk
  extend Configuration
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
