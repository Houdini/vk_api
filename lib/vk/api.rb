require 'vk/connection'
require 'vk/configuration'
require 'vk/request'

module Vk
  class Api
    include Connection
    include Request

    attr_accessor *Configuration::VALID_OPTIONS_KEYS

    def initialize options = {}
      options = Vk.options.merge(options)
      Configuration::VALID_OPTIONS_KEYS.each do |key|
        send("#{key}=", options[key])
      end
    end
  end
end
