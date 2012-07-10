require 'timeout'
require 'faraday_middleware'
require 'faraday'
require 'vk/helpers/timeout_error_helper'
require 'vk/helpers/json_error_helper'

module Vk
  module Request

    SEPARATOR = ','

    def get path, options = {}
      request(:get, path, options)
    end

    def post path, options = {}
      request(:post, path, options)
    end

    def put(path, options = {})
      request(:put, path, options)
    end

    def delete(path, options = {})
      request(:delete, path, options)
    end

    private

      def adopt_options options
        options.each_pair do |key, value|
          if value.kind_of? Array
            options[key] = options[key].join(SEPARATOR)
          end
        end
        options
      end

      def request(method, path, options)

        options = options.merge access_token: access_token
        options = adopt_options options

        response = Timeout.timeout(timeout) do
          connection.send(method) do |request|
            case method.to_sym
            when :get, :delete
              request.url path, options
            when :post, :put
              request.path = path
              request.body = options unless options.empty?
            end
          end
        end
        enchant response
      rescue Timeout::Error
        Class.new { extend TimeoutErrorHelper::ClassMethods }
      rescue MultiJson::DecodeError
        Class.new { extend JsonErrorHelper::ClassMethods }
      end

      def enchant response
        if response.status == 200
          def response.ok?; true end
          def response.error_message; nil end

        else
          def response.ok?; false end
          def response.error_message; "Status not 200" end

        end

        response
      end
  end
end
