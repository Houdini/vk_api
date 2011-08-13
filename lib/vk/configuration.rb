require 'vk/version'

module Vk
  module Configuration
    VALID_OPTIONS_KEYS = [:endpoint, :user_agent, :adapter, :timeout, :access_token]

    DEFAULT_ADAPTER     = :net_http
    DEFAULT_ENDPOINT    = 'https://api.vkontakte.ru/method/'
    DEFAULT_USER_AGENT  = "vk gem #{Vk::VERSION}".freeze
    DEFAULT_TIMEOUT     = 5
    DEFAILT_ACCESS_TOKEN= nil

    attr_accessor *VALID_OPTIONS_KEYS

    def configure
      yield self
    end

    def self.extended(base)
      base.reset
    end

    def options
      options = {}
      VALID_OPTIONS_KEYS.each{|k| options[k] = send(k)}
      options
    end

    def reset
      self.adapter    = DEFAULT_ADAPTER
      self.endpoint   = DEFAULT_ENDPOINT
      self.user_agent = DEFAULT_USER_AGENT
      self.timeout    = DEFAULT_TIMEOUT
      self.access_token = DEFAILT_ACCESS_TOKEN
      self
    end

  end
end
